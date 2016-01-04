class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create  :get_pearson_student
  before_save    :get_pearson_student

  private

    def config_api
      app_id            = ENV['APP_ID']
      app_name          = "Progress Tracker"
      token_key_moniker = ENV['TOKEN_KEY_MONIKER']
      shared_secret     = ENV['SHARED_SECRET']
      client_string     = ENV['CLIENT_STRING']

      username_student  = self.email
      password          = ENV['PASSWORD'] # needs re-work
      base_uri          = "https://api.learningstudio.com"

      # --------------
      # Authentication
      # --------------
      # a generic carrier for the config information for all auth. methods
      # helpful to have all values in place, in case of using both OAuth 1 and OAuth 2
      config = LearningStudioAuthentication::Config::OAuthConfig.new({
        :application_name => app_name,
        :application_id   => app_id,
        :consumer_key     => token_key_moniker,
        :consumer_secret  => shared_secret,
        :client_string    => client_string
      })

      # instantiates the appropriate service for the auth. method you want to use
      factory = LearningStudioAuthentication::Service::OAuthServiceFactory.new(config)

      # --------
      # Requests
      # --------
      # handles all the work of making an API call
      @basic_service ||= LearningStudioCore::BasicService.new(factory)
      @basic_service.use_oauth2(username_student, password)
    end

    def flat_hash(h, k = [])
      new_hash = {}
      h.each_pair do |key, value|
        value = value.inject(:merge) if value.kind_of?(Array)
        if value.is_a? (Hash)
          new_hash.merge!(flat_hash(value, k + [key]))
        else
          new_hash[k + [key]] = value
        end
      end
      new_hash
    end

    def get_pearson_student
      config_api if @basic_service.nil?

      api_uri = "/me.json"
      begin
        response = @basic_service.request('GET', api_uri)
        puts "#{response.status_code} : #{response.status_message} : #{api_uri}" if response.error?
        @response = JSON.parse(response.content) unless response.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end

      unless @response.nil?
        self.pearson_id     ||= @response["me"]["id"]
        self.username       ||= @response["me"]["userName"]
        self.first_name     ||= @response["me"]["firstName"]
        self.last_name      ||= @response["me"]["lastName"]
        self.email_address  ||= @response["me"]["emailAddress"]
        self.client_string  ||= @response["me"]["clientString"]
      end
    end
end
