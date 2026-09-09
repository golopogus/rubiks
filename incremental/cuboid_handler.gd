extends Node

var pitch = 0.0
var prime = false
var edge_dict
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
var f = []
var b= []
var r= []
var l= []
var u= []
var d= []
var starting_mouse_pos


var packed: int =   packed0 | (packed1 << (5*1)) | (packed2 << (5*2)) | \
					(packed3 << (5*3)) | (packed4 << (5*4)) | (packed5 << (5*5))| \
					(packed6 << (5*6)) | (packed7 << (5*7)) | (packed8 << (5*8))| \
					(packed9 << (5*9)) | (packed10 << (5*10)) | (packed11 << (5*11))


var current_cube = packed

func _ready() -> void:
	create_init_dict()
	print(String.num_int64(current_cube,2))
	#f = [$edges/edge0,$edges/edge7,$edges/edge8,$edges/edge4]
	#b = [$edges/edge2,$edges/edge5,$edges/edge10,$edges/edge6]
	#r = [$edges/edge7,$edges/edge3,$edges/edge6,$edges/edge11]
	#l = [$edges/edge4,$edges/edge9,$edges/edge5,$edges/edge1]
	#u = [$edges/edge0,$edges/edge1,$edges/edge2,$edges/edge3]
	#d = [$edges/edge8,$edges/edge9,$edges/edge10,$edges/edge11]

	#turn_edges('u')
	
func turn_edges(turn_case):
	var axis
	var angle
	var edges = []
	var flip = false
	match turn_case:
		# orientation hierarchy defined as:
		# (u and d) = 1, (f and b) = 2, (r and l) = 3
		# therefore orientation flips on a f and b turn (f' and b' as well)
		
		
		'u':
			edges = [0,1,2,3]
			axis = 'y'
			angle = -PI/2
		'u_prime':
			edges = [3,2,1,0]
			axis = 'y'
			angle = PI/2
		
		'd':
			edges = [11,10,9,8]
			axis = 'y'
			angle = PI/2
		'd_prime':
			edges = [8,9,10,11]
			axis = 'y'
			angle = -PI/2
			
####################################		
		'f':
			flip = true
			edges = [0,7,8,4]
			axis = 'z'
			angle = -PI/2
		'f_prime':
			flip = true
			edges = [4,8,7,0]
			axis = 'z'
			angle = PI/2
			
		'b':
			flip = true
			edges = [2,5,10,6]
			axis = 'z'
			angle = PI/2
		'b_prime':
			flip = true
			edges = [6,10,5,2]
			axis = 'z'
			angle = -PI/2
			
###################################		
		'r':
			edges = [3,6,11,7]
			axis = 'x'
			angle = -PI/2
		'r_prime':
			edges = [7,11,6,3]
			axis = 'x'
			angle = PI/2
				
		'l':
			edges = [1,4,9,5]
			axis = 'x'
			angle = PI/2			
		'l_prime':
			edges = [5,9,4,1]	
			axis = 'x'
			angle = -PI/2
	
		
	
	var new_cube = current_cube
	
	var edge_bits_1 = find_edge(edges[0],flip)
	
	var edge_bits_2 = find_edge(edges[1],flip)
	
	var edge_bits_3 = find_edge(edges[2],flip)
	
	var edge_bits_4 = find_edge(edges[3],flip)
	
	
	var edge1_num = edge_bits_1 & 0b01111
	var edge2_num = edge_bits_2 & 0b01111
	var edge3_num = edge_bits_3 & 0b01111
	var edge4_num = edge_bits_4 & 0b01111
	var edges_num = [edge1_num,edge2_num,edge3_num,edge4_num]
	
	print(edges,edges_num)
	turn_3d_cube(axis,angle,edges_num)
	
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
	
	
func find_edge(edge_num,flip):
	
	var mask = 0b11111
	if flip == true:
		mask = 0b01111
		
	var edge = (current_cube >> 5 * edge_num) & mask
	
	return edge
	
#var edge0_loc = 0
#var edge1_loc = 1
#var edge2_loc = 2
#var edge3_loc = 3
#var edge4_loc = 4
#var edge5_loc = 5
#var edge6_loc = 6
#var edge7_loc = 7
#var edge8_loc = 8
#var edge9_loc = 9
#var edge10_loc = 10
#var edge11_loc = 11

func _process(delta: float) -> void:
	$cube/camera_pivot/camera_pivot_2/Camera3D.look_at($cube.global_position)
	#if Input.is_action_pressed("m_mouse"):
		#$cube/camera_pivot.rotate_x(PI/200)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("m_mouse"):
			#print(event.relative)
			$cube/camera_pivot.rotate_y(-event.relative.x * .01)
			pitch -= event.relative.y * .01
			pitch = clamp(pitch,-PI/2 + .01, PI/2 -.01)
			$cube/camera_pivot/camera_pivot_2.rotation.x = pitch#(event.relative.y * .01)
	
	if Input.is_action_just_pressed('prime'):
		if prime:
			prime = false
		else:
			prime = true
		print(prime)
	if Input.is_action_just_pressed("f"):
		if prime:
			turn_edges('f_prime')
		else:
			turn_edges('f')
	if Input.is_action_just_pressed("b"):
		if prime:
			turn_edges('b_prime')
		else:
			turn_edges('b')
	if Input.is_action_just_pressed("u"):
		if prime:
			turn_edges('u_prime')
		else:
			turn_edges('u')
	if Input.is_action_just_pressed("d"):
		if prime:
			turn_edges('d_prime')
		else:
			turn_edges('d')
	if Input.is_action_just_pressed("r"):
		if prime:
			turn_edges('r_prime')
		else:
			turn_edges('r')
	if Input.is_action_just_pressed("l"):
		if prime:
			turn_edges('l_prime')
		else:
			turn_edges('l')

	
		



		
		
		#$edges/edge0.rotate_x(PI/2)

#func rotate_f(edge):
	#edge.rotate_z(PI/2)

func turn_3d_cube(axis,angle,edges):
	var axis_vector
	match axis:
		'x': 
			axis_vector = Vector3(1,0,0)
		'y': 
			axis_vector = Vector3(0,1,0)
		'z': 
			axis_vector = Vector3(0,0,1)
	
	for edge in edges:
		var edge_body = edge_dict[edge]
		edge_body.rotate(axis_vector,angle)
	
func create_init_dict():
	edge_dict = {
		0: $cube/edges/edge0,
		1: $cube/edges/edge1,
		2: $cube/edges/edge2,
		3: $cube/edges/edge3,
		4: $cube/edges/edge4,
		5: $cube/edges/edge5,
		6: $cube/edges/edge6,
		7: $cube/edges/edge7,
		8: $cube/edges/edge8,
		9: $cube/edges/edge9,
		10: $cube/edges/edge10,
		11: $cube/edges/edge11,
	}
#func _on_f_face_body_entered(body: Node3D) -> void:
	#print(body)
	#f.append(body)


#func _on_f_face_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	#f.append(body)
	


#func _on_f_face_body_entered(body: Node3D) -> void:
	#f.append(body)
