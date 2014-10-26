class Tweet

	@@tweet_list = []

	attr_accessor :tweet

	def initialize(tweet)
		@tweet = tweet
	end

	def self.all
		@@tweet_list
	end

	def self.add_tweet(tweet)
		new_tweet = Tweet.new(tweet)
		@@tweet_list << new_tweet
		new_tweet
	end
end