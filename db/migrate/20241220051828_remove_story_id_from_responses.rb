class RemoveStoryIdFromResponses < ActiveRecord::Migration[6.1]
  def change
    remove_column :responses, :story_id, :integer
  end
end
