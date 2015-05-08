class Answer < ActiveRecord::Base
  include Scoring
  validates :content, presence: true

  belongs_to :question
  validates :question_id, presence: true

  belongs_to :user
  validates :user_id, presence: true

  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
