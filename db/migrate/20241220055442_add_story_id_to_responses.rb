class AddStoryIdToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :story_id, :bigint, null: false
    add_index :responses, :story_id
    add_foreign_key :responses, :stories, column: :story_id
  end
end
