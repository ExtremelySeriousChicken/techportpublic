class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text   :address
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :country
      t.decimal :longitude
      t.decimal :latitude
      t.string    :code
      t.timestamps null: false
    end
  end
end
