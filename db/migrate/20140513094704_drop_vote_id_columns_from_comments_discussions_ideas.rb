class DropVoteIdColumnsFromCommentsDiscussionsIdeas < ActiveRecord::Migration
  def change
    remove_column :comments, :vote_id
    remove_column :discussions, :vote_id
    remove_column :ideas, :vote_id
  end
end
