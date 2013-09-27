class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :user,  :null => false
      t.integer :buyer_id, :null => false
      t.integer :car_id,   :null => false
      t.boolean :result

      t.timestamps
    end
    add_index :offers, :user_id
  end
end
