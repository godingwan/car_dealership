class AddingSellableToCars < ActiveRecord::Migration
  def change
    add_column :cars, :sellable, :boolean, :default => true
  end
end
