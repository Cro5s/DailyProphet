class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.string :body
      t.integer :author_id
      t.integer :story_id

      t.timestamps
    end
  end
end
