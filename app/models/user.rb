class User < ApplicationRecord
  has_many :bookmarks

  validates :name, presence: true
  validates :email, presence: true, uniquness: true
  validates :password_digest, presence: true
end
