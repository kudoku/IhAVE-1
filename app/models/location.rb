class Location < ActiveRecord::Base
	belongs_to :user
	has_many :items

	validates :name, :description, presence: true
  
  paginates_per 6
end
