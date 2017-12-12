class Answer < ApplicationRecord
  belongs_to :user, :question
  has_many :comments, as: :commentable 
end
