class Record < ActiveRecord::Base
  belongs_to :item

  validates :borrower_name, presence: true,
end
