class Question < ApplicationRecord
  has_many :answers,
  has_many :comments, as: :commentable
  has_many :votes
  belongs_to :user
end
