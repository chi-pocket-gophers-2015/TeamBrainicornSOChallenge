get '/' do
  redirect '/index'
end

get '/index' do
  @questions = Question.all
  @answer_counts = @questions.map{ |question| question.answers.count }
  @scores = @questions.map{ |question| question.score }
  erb :index
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"posts/question"
end


# this goes with the new-comment ajax request in application.js
# get '/comments/new' do


# end
