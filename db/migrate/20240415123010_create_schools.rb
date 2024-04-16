class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :network_id

      t.timestamps
    end
    add_index :schools, :network_id
  end
end
