helpers do

  SECONDS_IN = {year: 31536000, month: 2629740, week: 604800, day: 86400, hour: 3600, minute: 60, second: 1}

  def timeago(time)
    seconds_ago = (Time.now - time).to_i+1
    SECONDS_IN.each do |unit, seconds|
      conversion = seconds_ago / seconds
      return "#{conversion} #{unit}#{"s" if conversion > 1} ago" if conversion > 0
    end
  end

  def relative_time_ago(num, units)
    return Time.now - (num * SECONDS_IN[units])
  end

  def canonical_time(time)
    time.getlocal.strftime("%l:%M %p %B %-d, %Y")
  end

end
