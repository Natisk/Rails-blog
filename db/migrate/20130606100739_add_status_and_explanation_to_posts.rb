class AddStatusAndExplanationToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :status, :boolean, :default => false
    add_column :posts, :explanation, :text
  end

  def down
    remove_column :posts, :status
    remove_column :posts, :explanation
  end
end
