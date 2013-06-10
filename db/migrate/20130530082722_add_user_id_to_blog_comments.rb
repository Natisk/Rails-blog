class AddUserIdToBlogComments < ActiveRecord::Migration
  def up
    add_column :blog_comments, :user_id, :string
  end

  def down
    remove_column :blog_comments, :user_id
  end
end
