class Record < ActiveRecord::Base
  belongs_to :item
  has_one :borrower

  validates :borrower_name, presence: true

  accepts_nested_attributes_for :borrower, reject_if: ->(hash_of_attributes) { hash_of_attributes['name'].blank? }

end

