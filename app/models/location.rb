class Location < ActiveRecord::Base
	belongs_to :user
	has_many :items
  paginates_per 6
end
