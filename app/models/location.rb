class Location < ActiveRecord::Base
	belongs_to :user
	has_many :items, dependent: :destroy

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "Logo.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	validates :name, :description, presence: true
  
  paginates_per 6
end
