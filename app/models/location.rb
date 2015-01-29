class Location < ActiveRecord::Base
	belongs_to :user
	has_many :items, dependent: :destroy

	validates :name, :description, presence: true
  
  paginates_per 6
end
