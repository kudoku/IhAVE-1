class Item < ActiveRecord::Base
	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests
  belongs_to :location
  belongs_to :user
  validates :name, presence: true
end
