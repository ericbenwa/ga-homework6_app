class Tweet

	@@tweet_list = []

	attr_accessor :tweet

	def initialize(tweet)
		@tweet = tweet
		# @@tweet_list.push([tweet, content])
	end

	def self.all
		@@tweet_list
	end

	def self.add_tweet(title)
		tweet = Tweet.new(title)
		@@tweet_list << tweet
		puts "You created a new tweet: #{title}"
	end
end