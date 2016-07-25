class Answer < ActiveRecord::Base
	include HasGravatar
	belongs_to :question

	def gravatar
		"http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
	end
end
