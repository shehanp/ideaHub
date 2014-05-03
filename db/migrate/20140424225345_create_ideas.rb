class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      t.boolean :fork, default: false

      t.timestamps
    end
  end
end
