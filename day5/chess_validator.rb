

module Board
	@@board = [
			[:bR, :bN, :bB, :bQ, :bK, :bB, :bN, :bR],
			[:bP, :bP, :bP, :bP, :bP, :bP, :bP, :bP],
			[],
			[],
			[],
			[],
			[:wP, :wP, :wP, :wP, :wP, :wP, :wP, :wP],
			[:wR, :wN, :wB, :wQ, :wK, :wB, :wN, :wR]]
		
	def get_out_board pos
		get_out = true
		if pos[0] >= 0 && pos[0] < @@board.length
			if pos[1] >= 0 && pos[1] < @@board.length
				get_out = false
			end
		end
		get_out
	end
end

module Horizontal_movement 
	include Board
	def validate_horizontal init_pos, end_pos, max_mov
		horizontal_movement = init_pos[0] == end_pos[0] && (init_pos[1] - end_pos[1]).abs <= max_mov 
		horizontal_movement && !get_out_board end_pos
	end
end

module Vertical_movement 
	include Board

	def validate_vertical init_pos, end_pos, max_mov

		vertical_movement = init_pos[1] == end_pos[1] && (init_pos[0] - end_pos[0]).abs <= max_mov
		vertical_movement && get_out_board end_pos

	end
end

module Cross_movement 

	include Board

	def validate_diagonal init_pos, end_pos, max_mov
		cross_movement = (init_pos[0]-end_pos[0]).abs == (init_pos[1]-end_pos[1]).abs 
		cross_movement && !get_out_board end_pos
	end
end

class Chess_piece

	attr_accessor :id, :color, :init_pos

	def initialize id, color, actual_pos
		@id = id
		@color = color
		@actual_pos = actual_pos

		##init pos podrá ser eliminada 
	end
end

class Rook < Chess_piece

	include Horizontal_movement
	include Vertical_movement

	def initialize id, color, actual_pos
		@max_mov = 7
		super(id, color, actual_pos)
	end

	def move_pos init_pos, end_pos
		move = false
		if validate_movement init_pos, end_pos
			@actual_pos = end_pos
			move = true
		end
	end

	def validate_movement init_pos, end_pos		
		valid_mov = "Illegal"
		val_h = validate_horizontal init_pos, end_pos, @max_mov
		val_v = validate_vertical init_pos, end_pos, @max_mov

		if val_h || val_v
			valid_mov = "Legal"
		end
		valid_mov
	end

end

class Pawn < Chess_piece

	include Vertical_movement

	def initialize id, color, actual_pos, direction
		@max_mov = 2
		@init = true
		@direction = direction
		super(id, color, actual_pos)
	end

	def move_pos init_pos, end_pos
	end

	def validate_movement init_pos, end_pos		
		valid_mov = "Illegal"
		val_v = validate_vertical init_pos, end_pos, @max_mov

		valid_mov = "Legal" if val_v

		no_pos_init if valid_mov == "Legal" && @init

		valid_mov
	end

	def no_pos_init 
		@init = false
		@max_mov = 1
	end

end

class Bishop < Chess_piece

	include Cross_movement

	def initialize id, color, actual_pos
		@max_mov = 7
		super(id, color, actual_pos)
	end

	def move_pos init_pos, end_pos
	end

	def validate_movement init_pos, end_pos		

		val_d = validate_diagonal init_pos, end_pos, @max_mov
		valid_mov = "Illegal"
		
		if val_d
			valid_mov = "Legal"
		end

		valid_mov
	end
end

class Kind < Chess_piece

	include Cross_movement
	include Horizontal_movement
	include Vertical_movement

	def initialize id, color, actual_pos
		@max_mov = 1
		super(id, color, actual_pos)
	end

	def move_pos init_pos, end_pos
	end

	def validate_movement init_pos, end_pos		

		val_d = validate_diagonal init_pos, end_pos, @max_mov
		val_h = validate_vertical init_pos, end_pos, @max_mov
		val_v = validate_horizontal init_pos, end_pos, @max_mov
		valid_mov = "Illegal"
		
		if val_d || val_h || val_v
			valid_mov = "Legal"
		end
		
		valid_mov
	end
end


class Queen < Chess_piece

	include Cross_movement
	include Horizontal_movement
	include Vertical_movement

	def initialize id, color, actual_pos
		@max_mov = 7
		super(id, color, actual_pos)
	end

	def move_pos init_pos, end_pos
	end

	def validate_movement init_pos, end_pos		

		val_d = validate_diagonal init_pos, end_pos, @max_mov
		val_h = validate_vertical init_pos, end_pos, @max_mov
		val_v = validate_horizontal init_pos, end_pos, @max_mov
		valid_mov = "Illegal"
		
		if val_d || val_h || val_v
			valid_mov = "Legal"
		end
		
		valid_mov
	end
end


class Chess_validator

	def self.execution_game

		#bR1 = Rook.new "bR1", "black", [0,0]
		#puts bR1.validate_movement [5,0], [9,0] 

		#bP1 = Pawn.new "bP1", "black", [1,2]
		#puts bP1.validate_movement [1,2], [3,2]
		#puts bP1.validate_movement [3,2], [5,2]

		#wB1 = Bishop.new "wB1", "white", [0,3]
		#puts wB1.validate_movement [0,3], [1,4]

		#wK1 = Kind.new "wK1", "white", [7,4]
		#puts wK1.validate_movement [4,4], [4,5]

		bQ1 = Queen.new "bQ1", "black", [0,3]
		puts bQ1.validate_movement [0,3], [7, 3]

	end 

end

Chess_validator.execution_game








