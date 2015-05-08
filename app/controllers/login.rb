get '/login' do
  erb :'users/login'
end

post '/login' do
  if @user = User.authenticate(params[:username],params[:password])
    session[:user_id] = @user.id
    if request.xhr?
      erb :"partials/_navbar", layout: false
    else
      redirect '/'
    end
  else
    @error_messages = ["Invalid username and/or password"]
    erb :'users/login'
  end
end

delete '/sessions' do
  session.clear
  if request.xhr?
    erb :"partials/_navbar", layout: false
  else
    redirect '/'
  end
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

