module BoltsHelper

	def short_age_string(time)
    diff = Time.now - time #value is seconds (float)
    diff = diff.abs.to_i
    if diff >= 259200 #seconds in 3 days
      return time.in_time_zone("Eastern Time (US & Canada)").strftime("%b %d")
    elsif diff > 86400 #seconds in a day
      return "#{diff/86400}d ago"
    elsif diff > 3600 #seconds in an hour
      return "#{diff/3600}h ago"
    elsif diff > 60 #seconds in a minute
      return "#{diff/60}m ago"
    else
      return "#{diff}s ago"
    end
  end

end
