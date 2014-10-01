class RenamePinsToBolts < ActiveRecord::Migration
  def change
  	rename_table :pins, :bolts
  end
end
