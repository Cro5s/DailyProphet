class RemoveAuthorIdFromResponses < ActiveRecord::Migration[6.1]
  def change
    remove_column :responses, :author_id, :integer
  end
end
