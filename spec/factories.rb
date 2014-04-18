FactoryGirl.define do

  factory :user do

    sequence(:name)  { |n| "User #{n}" }
    sequence(:email) { |n| "user_#{n}@example.com"}

    password              "xxxxxxxx"
    password_confirmation "xxxxxxxx"
  end

  factory :device do

    user
    sequence(:name)   { |n| "Device #{n}" }
    sequence(:uid)    { |n| "abcdef_#{n}"}
    
    authentication_token   "xxxxxxxx"
  end

end

