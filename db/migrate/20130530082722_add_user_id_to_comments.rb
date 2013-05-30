class AddUserIdToComments < ActiveRecord::Migration
  def up
    add_column :comments, :user_id, :string
  end

  def down
    remove_column :comments, :user_id, :string
  end
end
