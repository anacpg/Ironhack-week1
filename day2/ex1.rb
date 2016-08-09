
class Car

	def initialize sound #, wheels = 4
		@sound = sound
		#@wheels = wheels
		@cities = load_cities
		@read = ""
		#tambien podemos poner @wheels = 4 y eliminarlo de los parametros
	end

	def make_noise 
		puts @sound
	end

	def self.speed_control 
		puts "Speed?"
		speed = gets.chomp.to_i
		if speed > 100
			puts "The speed is above 100. Reduce!"
		end
	end

	def visit_city city
		#@cities.push(city)
		#@cities << city

		## IO.write --> reemplaza todo lo del archivo y añade lo nuevo
		

		@cities << city
		IO.write("cities.txt", @cities.join(","))
	end

	def get_cities
		@cities = load_cities
	end

	def load_cities
		IO.read("cities.txt").split(',')
		#si el archivo esta vacio devuelve []
	end


end 



class Racing_car < Car

	def initialize sound
		@sound = "BROOOOM"
	end

end



class Person

	attr_reader :name

	def initialize name, age
		@name = name
		@age = age
	end
end

#car = Car.new("broom")
#another_car = Car.new("BROOOOM")

#Ex 1
#car.make_noise
#another_car.make_noise

#Ex 2
#Car.speed_control

#Ex 3
#car.visit_city("Londres")
#car.visit_city("Paris")

#puts car.get_cities

#Ex4
#car.visit_city("Madrid")
#car.visit_city("Sevilla")
#
#car.get_cities


##Ex. 5
#rc = Racing_car.new("br")
#puts rc.make_noise


#Ex. 6
p = Person.new("Maria", 29)
puts p.name
