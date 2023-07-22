class User < ApplicationRecord
  has_many :answers
  has_many :likes
  has_many :questions

  validates :name, presence: true
end
