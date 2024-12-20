class AddNullConstraintToUsers < ActiveRecord::Migration[6.1]
  def change
    columns = %i[username email password_digest session_token]
    columns.each do |column|
      change_column_null :users, column, false
    end
  end
end
