class User < ApplicationRecord
  has_many :bookmarks

  validates :name, presence: true
  validates :email, presence: true, uniquness: true
  validates :crypted_password, presence: true

end
