class AddIdeaIdToForkedIdeas < ActiveRecord::Migration
  def change
    add_column :forked_ideas, :idea_id, :integer
  end
end
