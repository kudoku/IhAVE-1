class AddBorrowerEmailToRecords < ActiveRecord::Migration
  def change
    add_column :records, :borrower_email, :string
  end
end
