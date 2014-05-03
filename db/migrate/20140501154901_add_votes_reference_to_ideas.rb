class AddVotesReferenceToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :vote, index: true
  end
end
