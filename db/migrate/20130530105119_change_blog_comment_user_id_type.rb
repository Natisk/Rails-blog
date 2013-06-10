class ChangeBlogCommentUserIdType < ActiveRecord::Migration
  def up
    remove_column :blog_comments, :user_id
    add_column :blog_comments, :user_id, :integer
  end

  def down
    remove_column :blog_comments, :user_id
    add_column :blog_comments, :user_id, :string

  end


end
