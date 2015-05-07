post '/votes' do
  if session[:user_id]
    params[:voteable_type].capitalize!
    current_user.vote(params)
    content_type :json
    {score: params[:voteable_type].constantize.find(params[:voteable_id].to_i).score}.to_json
  else
    #return score without updating if no user is logged in
    {score: params[:voteable_type].constantize.find(params[:voteable_id].to_i).score}.to_json
  end
end
