class AddHasSentToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :has_sent, :boolean
  end
end
