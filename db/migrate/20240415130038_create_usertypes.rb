class CreateUsertypes < ActiveRecord::Migration[5.2]
  def change
    create_table :usertypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
