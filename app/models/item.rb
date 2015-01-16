class Item < ActiveRecord::Base
	acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :skills, :interests
  belongs_to :locations
  belongs_to :users
end
