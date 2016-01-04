class HomeController < ApplicationController
  before_action :authenticate_student!

  def index
  end

  def progress
  end

  def settings
  end

  def update
    current_student.update_attributes(student_params)
    redirect_to settings_url
  end

  private

    def student_params
      params.require(:student).permit(:username, :first_name, :last_name)
    end
end
