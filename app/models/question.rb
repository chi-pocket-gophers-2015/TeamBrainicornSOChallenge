class Question < ActiveRecord::Base
  include Scoring
  validates :content, presence: true
  validates :title, presence: true

  belongs_to :user
  belongs_to :best_answer, class_name: "Answer"
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  def created_ago
    timeago(self.created_at)
  end
end
