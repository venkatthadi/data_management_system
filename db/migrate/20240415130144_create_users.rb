class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :usertype_id
      t.integer :school_id

      t.timestamps
    end
    add_index :users, :usertype_id
    add_index :users, :school_id
  end
end
