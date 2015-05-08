module Scoring

  def score
    self.votes.inject(0) { |total,vote| vote.up ? total += 1 : total -= 1 }
  end

  # def created_ago
  #   timeago(self.created_at)
  # end
end
