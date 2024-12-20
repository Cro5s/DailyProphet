class AddAuthorIdToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :author_id, :bigint, null: false
    add_index :responses, :author_id
    add_foreign_key :responses, :users, column: :author_id
  end
end
