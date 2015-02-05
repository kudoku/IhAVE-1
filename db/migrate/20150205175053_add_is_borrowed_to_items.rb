class AddIsBorrowedToItems < ActiveRecord::Migration
  def change
    add_column :items, :is_borrowed, :boolean
    add_column :items, :borrowed_from, :string
  end
end
