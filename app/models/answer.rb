class Answer < ActiveRecord::Base
  include Scoring
  validates :content, presence: true
  belongs_to :question
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
