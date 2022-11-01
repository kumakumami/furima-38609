class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,        null: false 
      t.text :information,    null: false 
      t.integer :condition_id,   null: false 
      t.integer  :category_id,     null: false 
      t.integer  :state_id,     null: false 
      t.integer  :shipping_id,     null: false 
      t.integer  :delivery_days_id,     null: false 
      t.integer  :item_price,     null: false 
      t.references :user, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
