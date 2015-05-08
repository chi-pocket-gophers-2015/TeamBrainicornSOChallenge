get '/' do
  redirect '/index'
end

get '/index' do
  sort_pref = get_sort_method
  @questions = Question.get_all_sorted(sort_pref)

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

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  @best_answer = @question.best_answer
  erb :"posts/question"
end

get '/comments/new' do
  if request.xhr?
    erb :'partials/_new_comment_form', layout: false
  else
    erb :'partials/_new_comment_form'
  end
end


get '/sort_by/votes' do
  session[:sorting] = "votes"
  redirect '/'
end

get '/sort_by/recent' do
  session[:sorting] = "recent"
  redirect '/'
end

get '/sort_by/trending' do
  session[:sorting] = "trending"
  redirect '/'
end


post '/questions' do
  puts params.inspect
  puts "user id: #{session[:user_id]}"
  puts "current user: #{current_user}"
  @question = current_user.questions.create(params)
  redirect '/index'
end

post '/questions/:id/answers' do
  if request.xhr?
    answer_data = filter(params)
    answer = Answer.create(answer_data)
    erb :"partials/_full_answer", layout: false, locals: {answer: answer}
  else
    Answer.create(params[:answer])
    redirect "/questions/#{params[:id]}"
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

post '/questions/:question_id/answers/:answer_id/best' do
  question = Question.find(params[:question_id].to_i)
  question.update_attributes(best_answer_id: params[:answer_id].to_i)
  redirect "/questions/#{params[:question_id]}"
end

