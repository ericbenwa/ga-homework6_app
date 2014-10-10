class User
	attr_accessor :user, :password, :signed_in

	$user_list = []

	def initialize(user, password)
		@user = user
		@password = password
		# @signed_in = false
		$user_list.push([user, password])
	end

	def self.sign_in
		puts "Enter your username."
		$entered_user = gets.chomp

		puts "Enter your password."
		$entered_password = gets.chomp

		$user_list.each do |user, password|
			if $entered_user == user && $entered_password == password
				puts "Signed in as #{user}."
				break
			else
				puts "Incorrect! Your username of password is incorrect."
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

	def sign_out
		# $session = []
		# puts $session
	end

	def self.list
		$user_list.each { |user, password| puts "#{user} and #{password}"}
	end

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

	def tweet
		puts "we tweeting."
	end
end