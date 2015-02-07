class Record < ActiveRecord::Base
  belongs_to :item
 
  validates :borrower_name, presence: true
  validates :date_due, presence: true


end
