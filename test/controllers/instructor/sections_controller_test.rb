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
end
