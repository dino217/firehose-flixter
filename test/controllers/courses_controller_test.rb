require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test "course show page" do
    course = FactoryGirl.create(:course)
    get :show, id: course.id
    assert_response :success
  end

  test "course show page, not found" do
    get :show, id: 'ZOMG'
    assert_response :not_found
  end

  test "course index page" do
    FactoryGirl.create(:course)
    get :index
    assert_response :success
    assert_select "h2", "Testing on Rails"
  end

end
