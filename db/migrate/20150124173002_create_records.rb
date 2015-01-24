class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :due_date
      t.datetime :date_returned
      t.string :borrower_name
      t.integer :times_lent

      t.timestamps
    end
  end
end
