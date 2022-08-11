# frozen_string_literal: true

class ChangeForeignKeyForLike < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :users_id, :AuthorId
  end
end
