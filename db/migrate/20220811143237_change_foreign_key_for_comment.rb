# frozen_string_literal: true

class ChangeForeignKeyForComment < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :users_id, :AuthorId
  end
end
