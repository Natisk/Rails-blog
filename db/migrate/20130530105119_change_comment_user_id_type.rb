class ChangeCommentUserIdType < ActiveRecord::Migration
  def up
    remove_column :comments, :user_id
    add_column :comments, :user_id, :integer
  end

  def down
    add_column :comments, :user_id, :string
    remove_column :comments, :user_id
  end


end
