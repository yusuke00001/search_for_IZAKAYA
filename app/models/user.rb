class User < ApplicationRecord
  has_many :bookmarks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
