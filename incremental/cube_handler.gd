extends Node

var red = face1.new(0,4,5,3,2,1,'r')
var orange = face1.new(1,4,5,2,3,0,'o')
var blue = face1.new(2,4,5,0,1,3,'b')
var green = face1.new(3,4,5,1,0,2,'g')
var yellow = face1.new(4,1,0,3,2,5,'y')
var white = face1.new(5,0,1,3,2,4,'w')
var cube = [red.stickers,orange.stickers,blue.stickers,green.stickers,yellow.stickers,white.stickers]

#f = red = 0
#b = orange = 1
#l = blue = 2
#r = green = 3
#u = yellow = 4
#d = white = 5
func _ready() -> void:
	f_turn()
	r_turn()
	print(cube)

func f_turn():
	var old_cube = cube.duplicate(true)
	for row in range(3):
		for col in range(3):
			cube[0][row][col] = old_cube[0][2-col][row]
			
	
	for i in range(3):
		
		cube[4][2][i] = old_cube[2][2-i][2]
		cube[2][i][2] = old_cube[5][0][i]
		cube[5][0][i] = old_cube[3][2-i][0]
		cube[3][i][0] = old_cube[4][2][i]
		
func f_prime_turn():
	var old_cube = cube.duplicate(true)
	for col in range(3):
		for row in range(3):
			cube[0][row][col] = old_cube[0][col][2-row]
		
	for i in range(3):
		
		cube[4][2][i] = old_cube[3][i][0]
		cube[3][i][0] = old_cube[5][0][2-i]
		cube[5][0][i] = old_cube[2][i][2]
		cube[2][i][2] = old_cube[4][2][2-i]
	

func b_turn():
	var old_cube = cube.duplicate(true)
	for row in range(3):
		for col in range(3):
			cube[1][row][col] = old_cube[1][2-col][row]
			
	
	for i in range(3):
		
		cube[4][0][i] = old_cube[3][2-i][2]
		cube[3][i][2] = old_cube[5][2][i]
		cube[5][2][i] = old_cube[2][2-i][0]
		cube[2][i][0] = old_cube[4][0][i]

func b_prime_turn():
	var old_cube = cube.duplicate(true)
	for col in range(3):
		for row in range(3):
			cube[1][row][col] = old_cube[1][col][2-row]
			
	
	for i in range(3):
		
		cube[4][0][i] = old_cube[2][2-i][0]
		cube[2][i][0] = old_cube[5][2][i]
		cube[5][2][i] = old_cube[3][2-i][2]
		cube[3][i][2] = old_cube[4][0][i]
		

func d_turn():
	var old_cube = cube.duplicate(true)
	for row in range(3):
		for col in range(3):
			cube[5][row][col] = old_cube[5][2-col][row]
			
	
	for i in range(3):
		cube[0][2][i] = old_cube[2][2][i]
		cube[2][2][i] = old_cube[1][2][i]
		cube[1][2][i] = old_cube[3][2][i]
		cube[3][2][i] = old_cube[0][2][i]

func d_prime_turn():
	var old_cube = cube.duplicate(true)
	for col in range(3):
		for row in range(3):
			cube[5][row][col] = old_cube[5][col][2-row]
	
	for i in range(3):
		cube[0][2][i] = old_cube[3][2][i]
		cube[3][2][i] = old_cube[1][2][i]
		cube[1][2][i] = old_cube[2][2][i]
		cube[2][2][i] = old_cube[0][2][i]		
			
			
func u_turn():
	var old_cube = cube.duplicate(true)
	for row in range(3):
		for col in range(3):
			cube[4][row][col] = old_cube[4][2-col][row]
			
	
	for i in range(3):
		
		cube[1][0][i] = old_cube[2][0][i]
		cube[2][0][i] = old_cube[0][0][i]
		cube[0][0][i] = old_cube[3][0][i]
		cube[3][0][i] = old_cube[1][0][i]
		
func u_prime_turn():
	var old_cube = cube.duplicate(true)
	for col in range(3):
		for row in range(3):
			cube[4][row][col] = old_cube[4][col][2-row]	
	
	for i in range(3):
		
		cube[1][0][i] = old_cube[3][0][i]
		cube[3][0][i] = old_cube[0][0][i]
		cube[0][0][i] = old_cube[2][0][i]
		cube[2][0][i] = old_cube[1][0][i]

func r_turn():
	var old_cube = cube.duplicate(true)
	for row in range(3):
		for col in range(3):
			cube[3][row][col] = old_cube[3][2-col][row]
			
	
	for i in range(3):
		cube[4][i][2] = old_cube[0][i][2]
		cube[0][i][2] = old_cube[5][i][2]
		cube[5][i][2] = old_cube[1][2-i][0]
		cube[1][i][0] = old_cube[4][2-i][2]
		
func r_prime_turn():
	var old_cube = cube.duplicate(true)
	for col in range(3):
		for row in range(3):
			cube[3][row][col] = old_cube[3][col][2-row]		
			
	for i in range(3):
		cube[4][i][2] = old_cube[1][2-i][0]
		cube[1][i][0] = old_cube[5][2-i][2]
		cube[5][i][2] = old_cube[0][i][2]
		cube[0][i][2] = old_cube[4][i][2]

func l_turn():
	var old_cube = cube.duplicate(true)
	for row in range(3):
		for col in range(3):
			cube[2][row][col] = old_cube[2][2-col][row]
			
	for i in range(3):
		
		cube[4][i][0] = old_cube[1][2-i][2]
		cube[1][i][2] = old_cube[5][2-i][0]
		cube[5][i][0] = old_cube[0][i][0]
		cube[0][i][0] = old_cube[4][i][0]

func l_prime_turn():
	var old_cube = cube.duplicate(true)
	for col in range(3):
		for row in range(3):
			cube[2][row][col] = old_cube[2][col][2-row]		

	for i in range(3):
		
		cube[4][i][0] = old_cube[0][i][0]
		cube[0][i][0] = old_cube[5][i][0]
		cube[5][i][0] = old_cube[1][2-i][2]
		cube[1][i][2] = old_cube[4][2-i][0]
		
		
		
		


	
		
		

	
