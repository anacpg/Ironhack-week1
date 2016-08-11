
class Car 

	attr_reader :brand, :model

	def initialize brand, model, engine, sound
		@brand = brand
		@model = model
		@engine = engine
		@sound = sound
	end

	def make_noise 
		puts "@engine.move_pistons + #{@sound}"		
	end
end	

class Engine

	def initialize sound
		@sound = sound
	end 

	def move_pistons
		@sound
	end

end
