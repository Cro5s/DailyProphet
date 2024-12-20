class AddNullConstraintToResponses < ActiveRecord::Migration[6.1]
  def change
    columns = %i[body author_id story_id]
    columns.each do |column|
      change_column_null :responses, column, false
    end
  end
end
