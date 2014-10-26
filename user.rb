$session = nil

class User

	@@user_list = []

	attr_accessor :username, :password, :tweets

	def initialize(username, password)
		@username = username
		@password = password
		@tweets = []
	end

	def self.all
		@@user_list.each do |user|
			puts user.username
		end
	end

	def self.sign_up(username, password)
		@@user_list << User.new(username, password)
		puts "Thanks for signing up, #{username}."
	end

	def self.sign_in(username, password)
		@@user_list.each do |user|
			if user.username == username && user.password == password
				puts "Signed in as #{username}."
				$session = user
				break
			else
				puts "Incorrect! Your username or password is incorrect."
			end
		end
	end

	def self.sign_out
		if $session != nil
			puts "You have signed out, #{$session}."
			$session = nil
		else
			puts "Nobody is signed in. Unable to sign out."
		end
	end

	def tweet(tweet)
		if $session != nil
			new_tweet = Tweet.add_tweet(tweet)
			@tweets << new_tweet
		else
			puts "You need to sign in to tweet."
		end
	end

	def follow(username)
		if $session != nil
			found = false
			@@user_list.each do | user | 
				if username == user.username
					user.followers << self
					self.followed << user
					found = true
					puts "You just followed #{username}"
					break
				end
			end
		if !found
			puts "we couldn't find that user"
		end
		else
			puts "You'll need to be logged in to do that"
		end
	end

	def like(tweet_title)
		found = false
		Tweet.all.each do | tweet |
			if tweet.title == tweet_title
				@liked << tweet
				found = true
				break
			end
		end 
		if !found
			puts "sorry, we couldn't find a tweet with that title"
		end
	end

	def liked_tweets
		@liked.each do | tweet |
			puts tweet.title
			puts tweet.content
		end
	end
end