class RemoveTimesLentFromRecords < ActiveRecord::Migration
  def change
    remove_column :records, :times_lent
  end
end
