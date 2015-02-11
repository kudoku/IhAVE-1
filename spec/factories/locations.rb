# Read about factories at https://github.com/thoughtbot/factory_girl
n = 0
FactoryGirl.define do
	sequence :name do |n|
    "name#{n}"
  end

  factory :location, class: Location do
  	name 
  	description "MyString"
    user
  end
end
