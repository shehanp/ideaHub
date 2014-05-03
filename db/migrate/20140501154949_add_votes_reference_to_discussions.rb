class AddVotesReferenceToDiscussions < ActiveRecord::Migration
  def change
    add_reference :discussions, :vote, index: true
  end
end
