class RemoveVoteFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :vote, :integer
  end
end
