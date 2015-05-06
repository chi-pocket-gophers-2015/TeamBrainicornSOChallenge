get '/login' do
  erb :'users/login'
end

post '/login' do
  if @user = User.authenticate(params[:username],params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @error_messages = ["Invalid username and/or password"]
    erb :'users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @error_messages = @user.errors.full_messages
    erb :'users/new'
  end
end

