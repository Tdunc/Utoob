class Movie < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :comments
  has_many :likes
end
