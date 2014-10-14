$tweet_list = []

class Tweet
	attr_accessor :tweet, :content

	def initialize(tweet, content)
		@tweet = tweet
		@content = content
		$tweet_list.push([tweet, content])
	end

	def self.all
		$tweet_list.each { |tweet, content| puts "Tweet: #{tweet} and Content: #{content}"}
	end
end