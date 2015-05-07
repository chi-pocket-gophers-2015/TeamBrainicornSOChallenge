require 'faker'

User.create!(username: "admin")
User.create!(username: "CJ Witacker")
User.create!(username: "T-dog")
User.create!(username: "Penelope")

def rand_user
  num = rand(4) + 1
  return User.find(num).id
end

10.times do
  title = Faker::Hacker.say_something_smart
  content = Faker::Lorem.paragraph[0..255]
  Question.create!(title: title, content: content, user_id: rand_user)
end

Question.all.each do |question|
  3.times do
    content = Faker::Lorem.paragraph[0..255]
    question.answers.create!(content: content, user_id: rand_user)
  end

  10.times do
    rand > 0.25 ? up = true : up = false
    question.votes.create!(user_id: rand_user, up: up)
  end
end


