class Item < ActiveRecord::Base
  belongs_to :locations
  belongs_to :users
end
