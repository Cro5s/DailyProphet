class AddNullConstraintToStories < ActiveRecord::Migration[6.1]
  def change
    columns = %i[title body author_id]
    columns.each do |column|
      change_column_null :stories, column, false
    end
  end
end
