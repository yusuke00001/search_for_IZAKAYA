class User < ApplicationRecord
  has_many :bookmarks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
