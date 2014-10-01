module BoltsHelper
	def short_age_string(time)
    diff = Time.now - time #value is seconds (float)
    diff = diff.abs.to_i
    if diff >= 604800 #seconds in a week
      weeks = diff/604800
      return "#{weeks}#{"+" if weeks >= 999}W ago"
    elsif diff > 3600 #seconds in an hour
      return "#{diff/3600}H ago"
    else
      return "#{diff/60}#{minutes}M ago"
    end
  end
end
