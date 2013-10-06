module PastesHelper
	def createdAgo(paste)
		time_ago_in_words(paste.created_at, include_seconds: true) + " ago"
	end
end
