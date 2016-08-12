class Menu
	def self.do_count_words words
		puts words.chomp.split.size
	end
	def self.do_count_letters words
		puts words.size
	end
	def self.do_reverse words
		puts words.reverse
	end
	def self.do_uppercase words
		puts words.upcase
	end
	def self.do_downcase words
		puts words.downcase
	end
	def self.do_loquesea words
	end
end


class CLI

	def initialize(users)
		@users = users
		@status = false
	end

	def print_status
		if @status
			puts "User logged in"
		else
			puts "User not logged in"
		end
	end

	def login()
		puts "> Login: User"
		user_name = gets.chomp
		puts "> Password" 
		password = gets.chomp

		@users.each do |user|
			if (user_name == user.user_name && password == user.password)
				@status = true
			end
		end

		print_status
	end


	def doStuff()
		if (@status == false)
			puts "User needs authentication"
			return
		else
			puts "Insert words"
			string = gets.chomp

			puts "What do you want to do?"
			puts Menu.methods.grep(/do/)
			method = gets.chomp

			#call method with string argument
			begin
				Menu.send(method.to_sym,string)
			rescue
				puts "Learn to write, you idiot"
			end
		end

	end

end

class User
	attr_reader :user_name, :password
	def initialize(user_name, password)
		@user_name = user_name
		@password = password
	end
end

user1 = User.new("a","a")
user2 = User.new("lol","rofl")


users = []
users.push(user1)
users.push(user2)

cli = CLI.new(users)

cli.login()

cli.doStuff