class AddAuthorIdToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :author_id, :bigint, null: false
    add_index :stories, :author_id
    add_foreign_key :stories, :users, column: :author_id
  end
end
