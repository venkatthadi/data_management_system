class AddEmailToLogins < ActiveRecord::Migration[5.2]
  def change
    add_column :logins, :email, :string
  end
end
