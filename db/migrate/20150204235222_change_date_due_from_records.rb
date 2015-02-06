class ChangeDateDueFromRecords < ActiveRecord::Migration
  def up
    change_column :records, :date_due, :date
    change_column :records, :date_returned, :date
  end

  def down
    change_column :records, :date_due, :datetime
    change_column :records, :date_returned, :datetime
  end
end
