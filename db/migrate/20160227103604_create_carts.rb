class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.timestamps null: false
    end
  end
end
