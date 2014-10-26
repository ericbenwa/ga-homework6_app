require_relative "user"
require_relative "tweet"

active = true

while active == true
	puts "****************************************"
	puts ""
	puts ""
	puts "Welcome to the Twitter Command Line Interface. Please select from the commands below"
	puts ""
	puts "1: Sign up"
	puts "2: Sign in"
	puts "3: Sign out"
	puts "4: Create a new tweet (you must be signed in)"
	puts "5: List all tweets"
	puts "6: List your followers"
	puts "7: List everyone you follow"
	puts "8: Follow a user"
	puts "9: Like a tweet"
	puts "10: End your session"
	puts ""

	input = gets.chomp

	case input
		when "1"
			puts "Sign Up."
			puts "Create a username."
			username = gets.chomp

			puts "Create a password."
			password = gets.chomp

			User.sign_up(username, password)

		when "2"
			puts "Sign In."
			puts "Enter your username."
			username = gets.chomp

			puts "Enter your password."
			password = gets.chomp

			User.sign_in(username, password)

		when "3"
			puts "You just signed out."

			User.sign_out

		when "4"
			puts "Enter your tweet."
			new_tweet = gets.chomp

			$session.tweet(new_tweet)

		when "5"
			Tweet.all.each do |t|
				puts t.tweet
			end

		when "6"
			if $session != nil
				$session.followers.each do |user|
				puts user.username 
				end
			else
				puts "you need to be signed in to do that"
			end

		when "7"
			if $session != nil
				$session.followed.each do |user|
				puts user.username 
				end
			else
				puts "you need to be signed in to do that"
			end

		when "8"
			if $session != nil
				puts "pick a user you'd like to follow"
				User.all
				follow_user = gets.chomp
				$session.follow(follow_user)
			else
				puts "you need to be signed in to do that"
			end

		when "9"
			if $session != nil
				puts "pick a tweet you want to like (input the title)"
				Tweet.all.each do |tweet|
				puts tweet.title
				puts tweet.content
			end
			like_tweet = gets.chomp
			$session.like(like_tweet)
			puts "tweet liked!"
			puts "your liked tweets are below:"
			$session.liked_tweets
			else
				puts "you need to be signed in to do that"
			end

		when "10"
			puts "Thank you for using Twitter. Goodbye!"
			break
	end
end