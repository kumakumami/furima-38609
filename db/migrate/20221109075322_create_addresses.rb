class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip, null: false 
      t.integer :state_id, null: false 
      t.string :city,  null: false 
      t.string :addressline1,  null: false 
      t.string :addressline2
      t.string :tell,  null: false 
      t.references :order, null: false, foreign_key: true 
      
      t.timestamps
    end
  end
end
