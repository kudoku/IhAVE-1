# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence :email do |n|
    "person#{n+1}@example.com"
  end

  sequence :username do |n|
    "username#{n+1}"
  end

  FactoryGirl.define do
    factory :user do
    	email { generate(:email) }
    	password "123456789"
      username { generate(:username) }
      end
    end

  end
