class User < ApplicationRecord
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments
end
