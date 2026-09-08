extends Node


var packed0 = 0 | 1 << 4
var packed1 = 1 | 1 << 4
var packed2 = 2 | 1 << 4
var packed3 = 3 | 1 << 4
var packed4 = 4 | 1 << 4
var packed5 = 5 | 1 << 4
var packed6 = 6 | 1 << 4
var packed7 = 7 | 1 << 4
var packed8 = 8 | 1 << 4
var packed9 = 9 | 1 << 4
var packed10 = 10 | 1 << 4
var packed11 = 11 | 1 << 4

var edge0_loc = 0
var edge1_loc = 1
var edge2_loc = 2
var edge3_loc = 3
var edge4_loc = 4
var edge5_loc = 5
var edge6_loc = 6
var edge7_loc = 7
var edge8_loc = 8
var edge9_loc = 9
var edge10_loc = 10
var edge11_loc = 11

var packed: int =   packed0 | (packed1 << (5*1)) | (packed2 << (5*2)) | \
					(packed3 << (5*3)) | (packed4 << (5*4)) | (packed5 << (5*5))| \
					(packed6 << (5*6)) | (packed7 << (5*7)) | (packed8 << (5*8))| \
					(packed9 << (5*9)) | (packed10 << (5*10)) | (packed11 << (5*11))


var current_cube = packed

func _ready() -> void:
	
	print(String.num_int64(current_cube,2))
	turn('f')
	
func turn(turn_case):

	var edges = []
	
	match turn_case:
		'f':
			edges = [0,1,2,3]
		'f_prime':
			edges = [3,2,1,0]
		'r':
			edges = [3,6,11,7]
		'r_prime':
			edges = [7,11,6,3]
		
		
			
	
	var new_cube = current_cube
	
	var edge_bits_1 = find_edge(edges[0])
	var edge_bits_2 = find_edge(edges[1])
	var edge_bits_3 = find_edge(edges[2])
	var edge_bits_4 = find_edge(edges[3])
	
	
	# creates a mask where the original string is 0s where we want
	new_cube &= ~(0b11111 << (5 * edges[1]))
	# inserts new string into 0s we made earlier
	new_cube |= edge_bits_1 << (5 * edges[1])
	
	new_cube &= ~(0b11111 << (5 * edges[2]))
	new_cube |= edge_bits_2 << (5 * edges[2])
	
	new_cube &= ~(0b11111 << (5 * edges[3]))
	new_cube |= edge_bits_3 << (5 * edges[3])
	
	new_cube &= ~(0b11111 << (5 * edges[0]))
	new_cube |= edge_bits_4 << (5 * edges[0])
	
	current_cube = new_cube
	
	print(String.num_int64(current_cube,2))
	
#func f_turn():
	#
	#
	#
	#
	#print(String.num_int64(packed,2))
	#var new_cube = packed
#
	#
	#var edge0_old = (packed) & 0b11111
	#var edge1_old = (packed >> 5 * edge1_loc) & 0b11111
	#var edge2_old = (packed >> 5 * edge2_loc) & 0b11111
	#var edge3_old = (packed >> 5 * edge3_loc) & 0b11111
#
	#
	#new_cube &= ~(0b11111 << (5 * edge1_loc))
	#new_cube |= edge0_old << (5 * edge1_loc)
	#
	#new_cube &= ~(0b11111 << (5 * edge2_loc))
	#new_cube |= edge1_old << (5 * edge2_loc)
	#
	#new_cube &= ~(0b11111 << (5 * edge3_loc))
	#new_cube |= edge2_old << (5 * edge3_loc)
	#
	#new_cube &= ~(0b11111 << (5 * edge0_loc))
	#new_cube |= edge3_old << (5 * edge0_loc)
	#
	#
	#print(String.num_int64(new_cube,2))
	
func find_edge(edge_num):
	
	var edge = (current_cube >> 5 * edge_num) & 0b11111
	
	return edge
	
#func move_edge0(cube,location):
	#var edge0_old = (cube) & 0b11111
	#var new_cube = cube
	#new_cube &= ~(0b11111 << (5 * location))
	#new_cube |= edge0_old << (5 * location)
	#
	#current_cube = new_cube
	
	
