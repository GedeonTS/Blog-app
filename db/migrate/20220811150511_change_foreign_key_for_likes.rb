class ChangeForeignKeyForLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :posts_id, :PostId
  end
end
