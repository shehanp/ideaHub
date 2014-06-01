class CreateForkedIdeas < ActiveRecord::Migration
  def change
    create_table :forked_ideas do |t|
      t.string :title
      t.text :body
      t.integer :fork_id
      t.string :image

      t.timestamps
    end
  end
end
