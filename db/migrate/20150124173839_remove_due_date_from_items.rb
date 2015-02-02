class RemoveDueDateFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :due_date
  end
end
