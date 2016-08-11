
class Car

	attr_reader :brand, :model

	def initialize brand, model
		@brand = brand
		@model = model
	end

end


class CarDealer

	def initialize
		@inventory = []
	end 

	def add_car car
		@inventory << car
	end

	def cars brand

		filtered_cars = @inventory.select{|car| car.brand == brand} 
		show_cars  filtered_cars

	end

	def show_cars cars
		selected_brand = cars[0].brand

		models = cars.map{|car| car.model}

		models = filtered_models.join(", ")
		
		puts "#{selected_brand}: #{models}"

	end
end


fordFiesta = Car.new("Ford", "Fiesta")
fordMustang = Car.new("Ford", "Mustang")
hondaCivic = Car.new("Honda", "Civic")

carDealer = CarDealer.new
carDealer.add_car fordFiesta
carDealer.add_car fordMustang
carDealer.add_car hondaCivic

carDealer.cars("Ford")




