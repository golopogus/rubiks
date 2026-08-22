
class_name face
extends RefCounted

var face_num: int
var top: int
var bot: int
var left: int
var right: int
var opp: int
var color: String
var stickers: Array

func _init(face_n:int, top_rel: int,bot_rel:int,right_rel: int,left_rel:int, opp_rel:int, color1: String) -> void:
	face_num = face_n
	top = top_rel
	bot = bot_rel
	right = right_rel
	left = left_rel
	opp = opp_rel
	color = color1
	stickers = []
	for x in range(3):
		var temp = []
		for y in range(3):
			
			temp.append(color)
		stickers.append(temp)

func get_connected_piece():
	pass


	
	
	


#func _ready() -> void:
	#
	#var yellow_red
	#yellow_red.position = Vector3(0,0,0)
	#yellow_red.rotation = Vector3(0,0,0)
#
#func _ready() -> void:
	#var yellow_red = cuboid.new()
	#yellow_red.position = Vector3(1,1,1)
