class RemoveUserIdFromBookmarks < ActiveRecord::Migration[8.0]
  def change
    remove_column :bookmarks, :user_id, :bigint
  end
end
