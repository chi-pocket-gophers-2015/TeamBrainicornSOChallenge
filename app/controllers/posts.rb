get '/' do
  redirect '/index'
end

get '/index' do
  @questions = Question.all
  @answer_counts = @questions.map{ |question| question.answers.count }
  @scores = @questions.map{ |question| question.score }
  erb :index
end

get '/questions' do
  redirect '/index'
end

get '/questions/new' do
  puts "current user: #{current_user.username}"
  erb :"posts/new"
end

post '/questions' do
  puts params.inspect
  puts "user id: #{session[:user_id]}"
  puts "current user: #{current_user}"
  @question = current_user.questions.create(params)

  # @question = Question.new
  redirect '/index'
end

post '/questions/:id/answers' do
  Answer.create(params[:answer])
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"posts/question"
end





# this goes with the new-comment ajax request in application.js
get '/comments/new' do
  if request.xhr?
    erb :'partials/_new_comment_form', layout: false
  else
    erb :'partials/_new_comment_form'
  end
end

post '/comments' do
  @comment = current_user.comments.create(params)
  if request.xhr?
    erb :'partials/_single_comment', layout: false, locals: {comment: @comment}
  else
    redirect '/'
  end
end


