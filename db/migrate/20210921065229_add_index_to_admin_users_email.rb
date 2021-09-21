class AddIndexToAdminUsersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :email, unique: true
  end
end