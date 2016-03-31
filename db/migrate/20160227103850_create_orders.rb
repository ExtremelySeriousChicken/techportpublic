class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer
      t.integer    :status
      t.datetime   :approved_at
      t.timestamps null: false
    end
  end
end
