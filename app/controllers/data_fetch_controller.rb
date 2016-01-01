class DataFetchController < ApplicationController

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
end
