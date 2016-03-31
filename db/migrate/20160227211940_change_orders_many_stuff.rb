class ChangeOrdersManyStuff < ActiveRecord::Migration
  def change
    add_column :orders, :time_left, :integer
    add_column :orders, :message, :text
    add_column :orders, :phone_number, :string
    remove_column :orders, :customer_id, :integer
    add_column :orders, :sent_at, :datetime
  end
end
