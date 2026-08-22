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


func _ready() -> void:
	
	var packed: int =   packed0 | (packed1 << (5*1)) | (packed2 << (5*2)) | \
						(packed3 << (5*3)) | (packed4 << (5*4)) | (packed5 << (5*5))| \
						(packed6 << (5*6)) | (packed7 << (5*7)) | (packed8 << (5*8))| \
						(packed9 << (5*9)) | (packed10 << (5*10)) | (packed11 << (5*11))
						
	#f = red = 0
	#b = orange = 1
	#l = blue = 2
	#r = green = 3
	#u = yellow = 4
	#d = white = 5
	# 1 - 4 are top - yellow
	# 5 and 8 are red
	# 6 and 7 are orange
	# 9-12 are white
	
	
	
	#print(String.num_int64(packed,2))
	#print(String.num_int64(packed1,2))

	#var edge0 = packed & 0b11111
	#var edge1 = (packed >> 5) & 0b11111
	#var edge2 = (packed >> 5) & 0b11111
	#var edge3 = (packed >> 10) & 0b11111
	#var edge4 = packed & 0b11111
	#var edge5 = (packed >> 5) & 0b11111
	#var edge6 = (packed >> 10) & 0b11111
	#var edge7 = packed & 0b11111
	#var edge8 = (packed >> 5) & 0b11111
	#var edge9 = (packed >> 10) & 0b11111
	#var edge10 = packed & 0b11111
	#var edge11 = (packed >> 5) & 0b11111
	
