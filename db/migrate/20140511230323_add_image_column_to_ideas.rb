class AddImageColumnToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :image, :string
  end
end
