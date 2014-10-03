class AddVotezToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :votez, :string
  end
end
