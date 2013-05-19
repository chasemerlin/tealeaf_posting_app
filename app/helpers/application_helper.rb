module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png"
	end

	def avatar_url_small(user)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}?s=28.png"
	end
end
