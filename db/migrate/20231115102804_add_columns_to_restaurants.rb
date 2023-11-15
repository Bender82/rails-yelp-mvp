class AddColumnsToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :phone_number, :string
    add_column :restaurants, :category, :string
  end
end
