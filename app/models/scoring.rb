module Scoring

  def score
    this.votes.inject(0) { |total,vote| vote.up ? total += 1 : total -= 1 }
  end
end
