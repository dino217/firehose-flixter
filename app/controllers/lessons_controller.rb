class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user_is_enrolled

  def show

  end

  private

  def validate_user_is_enrolled
    course = current_lesson.section.course
    enrolled = current_user.enrolled_in?(course)
    unless enrolled
      redirect_to course_path(course), alert: "You must enroll in that course first."
    end

  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
