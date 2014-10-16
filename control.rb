require_relative "user"
require_relative "tweet"

while

	input = gets.chomp

	case input
		when "1"
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
	end

end