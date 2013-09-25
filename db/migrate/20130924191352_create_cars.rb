class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :year,     :null => false
      t.string :make,      :null => false
      t.string :model,     :null => false
      t.float :list_price, :null => false
      t.references :user,  :null => false

      t.timestamps
    end
    add_index :cars, :user_id
  end
end
