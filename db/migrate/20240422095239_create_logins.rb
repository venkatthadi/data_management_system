class CreateLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
