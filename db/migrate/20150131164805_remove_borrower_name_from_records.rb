class RemoveBorrowerNameFromRecords < ActiveRecord::Migration


  def up
    add_column :records, :borrower_id, :integer
    remove_column :records, :borrower_name
  end
end
