$user_list = []
$session = nil

class User
	attr_accessor :user, :password, :tweet

	def initialize(user, password)
		@user = user
		@password = password
		# @signed_in = false
		@tweet = nil
		$user_list.push([user, password, tweet])
	end

	def self.create_account
	end

	def self.sign_in
		puts "Enter your username."
		$entered_user = gets.chomp

		puts "Enter your password."
		$entered_password = gets.chomp

		$user_list.each do |user, password|
			if $entered_user == user && $entered_password == password
				puts "Signed in as #{user}."
				$session = user
				break
			else
				puts "Incorrect! Your username or password is incorrect."
			end
		end

		# if @user == entered_user && @password == entered_password
		# 	puts "Success! You are now signed in."
		# 	# signed_in = true
		# 	puts $session = [user, password]
		# else
		# 	puts "Incorrect! Your username of password is incorrect." # Enhance by asking the user to try again.
		# end
	end

	def self.sign_out
		if $session != nil
			puts "You have signed out, #{$session}."
			$session = nil
		else
			puts "Nobody is signed in."
		end
	end

	# def self.list
	# 	$user_list.each { |user, password| puts "#{user} and #{password}"}
	# end

	# def self.testloop
	# 	$entered_userr = "eric"
	# 	$entered_passwordd = "pw"

	# 	$user_list.each do |user, password|
	# 		if $entered_userr == user && $entered_passwordd == password
	# 			puts "signed in"
	# 		else
	# 			puts "incorrect"
	# 		end
	# 	end
	# end

	def self.tweet
		if $session != nil
			@tweet = gets.chomp
			
		else
			puts "You need to sign in to tweet."
		end
	end
end