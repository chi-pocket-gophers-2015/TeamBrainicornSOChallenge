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
  redirect '/index'
end

post '/questions/:id/answers' do
  Answer.create(params[:answer])
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @best_answer = @question.best_answer
  erb :"posts/question"
end

post '/questions/:question_id/answers/:answer_id/best' do
  question = Question.find(params[:question_id].to_i)
  question.update_attributes(best_answer_id: params[:answer_id].to_i)
  redirect "/questions/#{params[:question_id]}"
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
  params[:commentable_type].capitalize!
  puts "params: #{params}"
  @comment = current_user.comments.create(params)
  if request.xhr?
    erb :'partials/_single_comment', layout: false, locals: {comment: @comment}
  else
    redirect '/'
  end
end


