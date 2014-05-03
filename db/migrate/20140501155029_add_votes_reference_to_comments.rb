class AddVotesReferenceToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :vote, index: true
  end
end
