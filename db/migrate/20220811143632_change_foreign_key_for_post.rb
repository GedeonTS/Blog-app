# frozen_string_literal: true

class ChangeForeignKeyForPost < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :users_id, :AuthorId
  end
end
