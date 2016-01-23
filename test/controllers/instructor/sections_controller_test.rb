require 'test_helper'

class Instructor::SectionsControllerTest < ActionController::TestCase
  test "instructor new section page" do
    course = FactoryGirl.create(:course)
    get :new, course_id: course.id
    assert_response :success
  end

  test "Instructor new section page with bad course id, not found" do
    get :new, course_id: 'ZOMG'
    assert_response :not_found
  end

  test "Create new section redirects to course" do
    @course = FactoryGirl.create(:course)
    @section = FactoryGirl.attributes_for(:section)
    post :create, course_id: @course.id, section: @section
    assert @course.sections.first
  end

  test "Create does not create section if title is blank" do
    @course = FactoryGirl.create(:course)
    @section = FactoryGirl.attributes_for(:section, title: '')
    post :create, course_id: @course.id, section: @section
    assert_not @course.sections.first
  end

end
