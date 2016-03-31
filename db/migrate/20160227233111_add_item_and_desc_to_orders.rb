class AddItemAndDescToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :item, :string
    add_column :orders, :description, :text
  end
end
