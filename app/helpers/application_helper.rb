module ApplicationHelper
  def full_name
    "#{current_student.first_name} #{current_student.last_name}" if student_signed_in?
  end
end
