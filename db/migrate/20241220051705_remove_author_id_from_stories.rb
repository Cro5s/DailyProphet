class RemoveAuthorIdFromStories < ActiveRecord::Migration[6.1]
  def change
    remove_column :stories, :author_id, :integer
  end
end
