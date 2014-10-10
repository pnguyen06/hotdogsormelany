class AddLastBoltAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_bolt_at, :datetime
  end
end
