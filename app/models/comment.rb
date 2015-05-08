class Comment < ActiveRecord::Base
  include Scoring
  validates :content, presence: true

  belongs_to :user
  validates :user_id, presence: true

  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :voteable

end
