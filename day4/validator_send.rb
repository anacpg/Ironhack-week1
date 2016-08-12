
#class Menu
#	def count_words text
#		words = text.split(" ")
#		num_words = words.size 
#	end
#
#	def count_letters text
#		words_without_puc = texto.gsub(/[^a-zA-Z0-9\s]/i, '').split
#		characters = words_without_puc.join("").scan /\w/
#		characters.size
#	end
#
#	def reverse_text text
#		text.reverse
#	end	
#
#	def uppercase text
#		text.upcase
#	end
#end


class User

	attr_reader :user, :pass

	def initialize user, pass
		@user = user
		@pass = pass
	end

end


class Validator

	@@users = []

	def self.add_user user
		@users << user
	end

	def self.check_user user, pass

		is_correct = @users.map { |us|
			us.user == user && us.pass == pass
		} 

	end
end


class CLI

	def exec_program

		ask_user
		text = ask_text
		puts count_words text 

	end

	def ask_user

		user_correct = false

		while !user_correct

			puts "Get user: "
			user = gets.chomp
			puts "Get pass: "
			pass = gets.chomp

			user_correct = Validator.check_user user, name

			"User or password incorrect!" if !user_correct
		end
	end

	def ask_text
		puts "Write a text:"
		text = gets.chomp

		puts "Choose an option \n
			1. Count words\n
			2. Count letters\n
			3. Reverse text\n
			4. Convert the text to uppercase"

		option = gets.chomp.to_i

		#hash_options = {
		#	1: count_words,
		#	2: count_letters,
		#	3: reverse_text,
		#	4: uppercase
		#}
		##  puts hash_options[option]

		### switch

		case option
		when 1
			count_words text
		when 2
			count_letters text
		when 3
			reverse_text text
		when 4
			uppercase text 
		end

		
	end
	

	def count_words text
		words = text.split(" ")
		num_words = words.size 
	end

	def count_letters text
		words_without_puc = texto.gsub(/[^a-zA-Z0-9\s]/i, '').split
		characters = words_without_puc.join("").scan /\w/
		characters.size
	end

	def reverse_text text
		text.reverse
	end	

	def uppercase text
		text.upcase
	end


end


marcos = User.new "Marcos", "marc"
ana = User.new "Ana", "pass1"


=begin

puts Menu.methods.grep(/do/)	
method = gets.chomp

begin 
	Menu.send(method.to_sym, string)
rescue
	puts "Learn to write, you idiot"
end

=end











