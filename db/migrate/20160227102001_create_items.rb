class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :store, index:true
      t.string     :name
      t.decimal    :price
      t.text       :details
      t.timestamps null: false
    end
  end
end
