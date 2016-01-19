FactoryGirl.define do
  factory :course do
    title "Testing on Rails"
    description "Learn to test on Rails"
    cost 30
  end

  factory :user do
    email "Dino"
    password "testpassword"
    password_confirmation "testpassword"
  end

end
