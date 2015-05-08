class Question < ActiveRecord::Base
  include Scoring
  validates :content, presence: true
  validates :title, presence: true

  belongs_to :user
  validates :user_id, presence: true

  belongs_to :best_answer, class_name: "Answer"
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  def self.get_all_sorted(sort_pref)
    if sort_pref == "trending"
      Question.all.sort_by { |q| q.trend_score }.reverse
    elsif sort_pref == "recent"
      Question.all.order(created_at: :desc)
    else
      Question.all.sort_by { |q| q.score }.reverse
    end
  end


  def created_ago
    timeago(self.created_at)
  end

  def trend_score
    # returns the total number of answers, comments, and votes within a question
    hour_ago = Time.now - 1.hour

    created_at > hour_ago ? q_new=1 : q_new=0
    q_vote_count = votes.where("created_at >= ?", hour_ago).count
    ans_count = answers.where("created_at >= ?", hour_ago).count
    ans_vote_count = answers.inject(0) { |sum,a| a.votes.where("created_at >= ?", hour_ago).count + sum }
    comment_count = comments.where("created_at >= ?", hour_ago).count
    #we do not count the votes on comments since that functionality doesn't currently exist

    return q_new + q_vote_count + ans_count + ans_vote_count + comment_count
  end

  def get_sorted_answers
    return answers.sort_by { |a| a.score }.reverse
  end

end
