class AddIdeaReferenceToDiscussions < ActiveRecord::Migration
  def change
    add_reference :discussions, :idea, index: true
  end
end
