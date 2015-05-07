post '/votes' do
  if session[:user_id]
    vote_params = {
      voteable_type: params[:voteable_type].capitalize.constantize,
      voteable_id: params[:voteable_id].to_i,
      up: params[:up]
    }
    current_user.vote(vote_params)
    content_type :json
    {score: vote_params[:voteable_type].find(vote_params[:voteable_id]).score}.to_json
  else
    #return score without updating if no user is logged in
    {score: vote_params[:voteable_type].find(vote_params[:voteable_id]).score}.to_json
  end
end
