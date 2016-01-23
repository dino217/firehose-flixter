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
    @section = @course.sections.build(section_params)
    if @section.save
      redirect_to instructor_course_path(@course)
    else
      render text: "Could not be created"
    end
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end
end
