module UsersHelper

	def count_melany_bolts(users)
		mbolts = 0
		users.each do |user|
			if user.team == 'melany'
				mbolts += user.bolts.count
			end
		end
		return mbolts
	end

	def count_hotdogs_bolts(users)
		hdbolts = 0
		users.each do |user|
			if user.team == 'hotdogs'
				hdbolts += user.bolts.count
			end
		end
		return hdbolts
	end

end