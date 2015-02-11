# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :item do
  	name 'name'
  	description 'MyString'
  	is_out 'false'
  	tag_list "test"
		user
		location
  end
end
