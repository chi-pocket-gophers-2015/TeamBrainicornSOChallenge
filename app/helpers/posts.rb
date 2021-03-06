helpers do

  def best_answer
    html = "<span class='glyphicon glyphicon-star' aria-hidden='true'></span> "
    html += "<span class='glyphicon glyphicon-heart' aria-hidden='true'></span> "
    html += "<span class='glyphicon glyphicon-thumbs-up' aria-hidden='true'></span> "
    html += "<span class='glyphicon glyphicon-king' aria-hidden='true'></span> "
    html += "Best Answer "
    html += "<span class='glyphicon glyphicon-king' aria-hidden='true'></span> "
    html += "<span class='glyphicon glyphicon-thumbs-up' aria-hidden='true'></span> "
    html += "<span class='glyphicon glyphicon-heart' aria-hidden='true'></span> "
    html += "<span class='glyphicon glyphicon-star' aria-hidden='true'></span>"
    return html
  end

  def filter(hash)
    hash.except('splat','captures','id')
  end

  def get_sort_method
    session[:sorting] ||= "votes"
  end

end
