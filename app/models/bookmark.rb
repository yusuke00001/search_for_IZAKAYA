class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :user_id, uniquness: { scope: :shop_id }
end
