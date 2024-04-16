class CreateNetworks < ActiveRecord::Migration[5.2]
  def change
    create_table :networks do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
    end
    add_index :networks, :account_id
  end
end
