class AddAccountIdToSchool < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :account_id, :integer
  end
end
