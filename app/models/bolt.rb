class Bolt < ActiveRecord::Base
	belongs_to :user
	acts_as_votable
end
