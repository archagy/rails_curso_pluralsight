class Question < ActiveRecord::Base
	include HasGravatar
	has_many :answers

	def gravatar
		"http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
	end
end
