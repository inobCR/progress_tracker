class HomeController < ApplicationController
  before_action :authenticate_student!

  def sign_in
  end

  def index
  end

  def progress
  end

  def settings
  end
end
