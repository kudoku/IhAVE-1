# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  sequence :email do |n|
    "person#{n+1}@example.com"
  end

  FactoryGirl.define do
    factory :user do
    	email { generate(:email) }
    	password "123456789"
      end
    end

  end
