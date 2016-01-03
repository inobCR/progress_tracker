class DataFetchController < ApplicationController
  before_action :api_config, only: [:flow]

  def core
    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    # API_URI           = "/courses/#{COURSE_ID}"
    api_uri           = "/courses/#{course_id}"

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
    basic_service = LearningStudioCore::BasicService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    basic_service.use_oauth2(username_teacher)

    begin
      response = basic_service.request('GET', api_uri)
      @content = response.content unless response.error?

      # puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def exams
    # puts LearningStudioAuthentication.version

    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    teacher_id        = 32027111
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    # API_URI           = "/courses/#{COURSE_ID}"
    api_uri           = "/courses/#{course_id}"

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
    exam_service = LearningStudioExams::ExamService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    exam_service.use_oauth2(username_teacher)

    begin
      response = exam_service.get_all_exam_items(teacher_id, course_id)
      @content = response.content unless response.error?

      puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def grades
    # puts LearningStudioAuthentication.version

    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    teacher_id        = 32027111
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    # API_URI           = "/courses/#{COURSE_ID}"
    api_uri           = "/courses/#{course_id}"

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
    grade_service = LearningStudioGrades::Service.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    grade_service.use_oauth2(username_teacher)

    begin
      response = grade_service.get_gradebook_items(course_id)
      @content = response.content unless response.error?

      puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def content
    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    teacher_id        = 32027111
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    # API_URI           = "/courses/#{COURSE_ID}"
    api_uri           = "/courses/#{course_id}"

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
    content_service = LearningStudioContent::Service.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    content_service.use_oauth2(username_teacher)

    begin
      response = content_service.get_items(course_id)
      @content = response.content unless response.error?

      puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def announcements
    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    # API_URI           = "/courses/#{COURSE_ID}"
    api_uri           = "/courses/#{course_id}/announcements"

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
    basic_service = LearningStudioCore::BasicService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    basic_service.use_oauth2(username_teacher)

    begin
      response = basic_service.request('GET', api_uri)
      @content = response.content unless response.error?

      # puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def schedules
    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    # API_URI           = "/courses/#{COURSE_ID}"
    api_uri           = "/courses/#{course_id}/itemSchedules"

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
    basic_service = LearningStudioCore::BasicService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    basic_service.use_oauth2(username_teacher)

    begin
      response = basic_service.request('GET', api_uri)
      @content = response.content unless response.error?

      # puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def course_info
    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    teacher_id        = 32027111
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    api_uri           = "/users/#{teacher_id}/courses"

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
    basic_service = LearningStudioCore::BasicService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    basic_service.use_oauth2(username_teacher)

    begin
      response = basic_service.request('GET', api_uri)
      @content = response.content unless response.error?

      # puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def terms
    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    teacher_id        = 32027111
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    api_uri           = "/users/#{teacher_id}/terms"

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
    basic_service = LearningStudioCore::BasicService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    basic_service.use_oauth2(username_teacher)

    begin
      response = basic_service.request('GET', api_uri)
      @content = response.content unless response.error?

      # puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def users
    app_id            = ENV['APP_ID']
    app_name          = "Progress Tracker"
    token_key_moniker = ENV['TOKEN_KEY_MONIKER']
    shared_secret     = ENV['SHARED_SECRET']
    client_string     = ENV['CLIENT_STRING']

    username_student  = ENV['USERNAME_STUDENT']
    username_teacher  = ENV['USERNAME_TEACHER']
    teacher_id        = 32027111
    user_id           = 32027112
    password          = ENV['PASSWORD']
    base_uri          = "https://api.learningstudio.com"

    # this is (probably) accounting course ID
    course_id         = "12409825"
    api_uri           = "/users/#{user_id}"

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
    basic_service = LearningStudioCore::BasicService.new(factory)
    # basic_service.use_oauth2(USERNAME_STUDENT)
    basic_service.use_oauth2(username_student)

    begin
      response = basic_service.request('GET', api_uri)
      @content = response.content unless response.error?

      # puts "#{response.status_code} : #{response.status_message}" if response.error?
      # puts "#{response.methods.sort.each { |m| puts m }; nil}" if response.error?
      # puts "#{response.url}" if response.error?
      # puts "#{response.content}" unless response.error?
    rescue Exception => e
      puts "Exception from request calling #{api_uri} : #{e.message}"
    end

    @content = JSON.parse(@content)
  end

  def flow
    @requests = Hash.new

    # Step #1 - Authentication / Users APIs
    step_one
    # Step #2 - Terms APIs
    step_two
    # Step #3 - Course Info APIs
    step_three
    # Step #4 - Course Content APIs
    step_four_one
    step_four_two
    # Step #5 - Grades APIs
    step_five_one
    step_five_two
    step_five_three
  end

  private

    def api_config
      app_id            = ENV['APP_ID']
      app_name          = "Progress Tracker"
      token_key_moniker = ENV['TOKEN_KEY_MONIKER']
      shared_secret     = ENV['SHARED_SECRET']
      client_string     = ENV['CLIENT_STRING']

      username_student  = ENV['USERNAME_STUDENT']
      username_teacher  = ENV['USERNAME_TEACHER'] # stored just in case
      password          = ENV['PASSWORD']
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
      @basic_service = LearningStudioCore::BasicService.new(factory)
      @basic_service.use_oauth2(username_student, password)
    end

    # TODO: for future use (possibly w/ models in place)
    def store(key, value)
      @values ||= Hash.new
      @values[key.parameterize.underscore.to_sym] = value
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

    def step_one
      api_uri = "/me.json"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_one] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_one] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end

    def step_two
      api_uri = "/me/terms.json"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_two] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_two] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end

    def step_three
      api_uri = "/me/courses.json?expand=course"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_three] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_three] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end

    def step_four_one
      api_uri = "/me/courses/12409836/items.json"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_four_one] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_four_one] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end

    def step_four_two
      api_uri = "/me/courses/12409836/items/20074752353/schedule.json"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_four_two] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_four_two] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end

    def step_five_one
      api_uri = "/me/courses/12409836/gradebook/userGradebookItems.json?expand=grade"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_five_one] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_five_one] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end

    def step_five_two
      api_uri = "/me/courses/12409836/coursegradetodate.json"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_five_two] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_five_two] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end

    def step_five_three
      api_uri = "/me/courses/12409836/gradebook/userGradebookItemsTotals.json"
      begin
        resp = @basic_service.request('GET', api_uri)
        @requests[:step_five_three] = "#{resp.status_code} : #{resp.status_message} : #{api_uri}" if resp.error?
        @requests[:step_five_three] = flat_hash(JSON.parse(resp.content)) unless resp.error?
      rescue Exception => e
        puts "Exception from request calling #{api_uri} : #{e.message}"
      end
    end
end
