class User < ApplicationRecord
  has_secure_password validations: true
  has_many :bookmarks

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
