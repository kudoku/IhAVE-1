class RolifyCreatePublics < ActiveRecord::Migration
  def change
    create_table(:publics) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_publics, :id => false) do |t|
      t.references :user
      t.references :public
    end

    add_index(:publics, :name)
    add_index(:publics, [ :name, :resource_type, :resource_id ])
    add_index(:users_publics, [ :user_id, :public_id ])
  end
end
