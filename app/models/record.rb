class Record < ActiveRecord::Base
  belongs_to :item

  validates :borrower_name, presence: true
  validates :date_due, presence: true

  after_save :times_lent_out


  def times_lent_out(record)
    count = record.times_lent += 1
    item.update_attribute(times_lent: count)
  end

end
