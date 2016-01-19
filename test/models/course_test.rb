require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "Valid Course passes validation" do
    FactoryGirl.create(:course)
    assert_equal 1 , Course.all.count
  end

  test "Validates presence of title" do
    course = FactoryGirl.build(:course, title: '')
    assert_not course.save
  end

  test "Validates presence of description" do
    course = FactoryGirl.build(:course, description: '')
    assert_not course.save
  end

  test "Validates presence of cost" do
    course = FactoryGirl.build(:course, cost: nil )
    assert_not course.save
  end

  test "Validates cost is positive" do
    course = FactoryGirl.build(:course, cost:-35)
    assert_not course.save
  end

  test "Validates cost is number" do
    course = FactoryGirl.build(:course, cost: "thirty-five")
    assert_not course.save
  end
end
