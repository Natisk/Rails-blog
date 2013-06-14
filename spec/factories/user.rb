FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user1#{i}@example.org" }
    password 'password'
    password_confirmation { |user| user.password }
  end

  factory :invalid_user, :parent => :user do
    email ""
  end
end