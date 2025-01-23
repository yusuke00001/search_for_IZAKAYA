class AddColumnToBookmarks < ActiveRecord::Migration[8.0]
  def change
    add_reference :bookmarks, :user, foreign_key: true
    add_reference :bookmarks, :shop, foreign_key: true
  end
end
