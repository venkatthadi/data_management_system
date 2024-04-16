class AddNetworkIdToNetworks < ActiveRecord::Migration[5.2]
  def change
    add_column :networks, :network_id, :integer
    add_index :networks, :network_id
  end
end
