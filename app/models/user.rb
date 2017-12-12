class User < ApplicationRecord
  has_many :questions, :answers, :votes, :comments
end
