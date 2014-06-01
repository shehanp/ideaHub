class SwitchForkBooleanToParentId < ActiveRecord::Migration
  def change
    add_column :ideas, :forked_from_idea_id, :integer
    remove_column :ideas, :forked, :boolean
  end
end
