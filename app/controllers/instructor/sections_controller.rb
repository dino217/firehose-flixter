class Instructor::SectionsController < ApplicationController
  def new
    @course = Course.where(id: params[:course_id]).first
    if @course.blank?
      render text: "Not Found", status: :not_found
    end
    @section = Section.new
  end

  def create
    @course = Course.find(params[:course_id])
    @section = @course.sections.create(section_params)

    redirect_to instructor_course_path(@course)
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end
end
