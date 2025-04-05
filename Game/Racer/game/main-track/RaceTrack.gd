extends Node3D

func ellipse_coordinates(player_position):
	# find the intersection between the ellipse and line
	var gradient = player_position[2] / (player_position[0] + 0.01)
	
	# ellipse is a = 210, b = 129
	var sol = sqrt((129 ** 2 * 210 **2) / ((129 ** 2 + (210 ** 2) * (gradient ** 2)) ) )
	if (gradient > 0 and player_position[0] > 0) or (gradient < 0 and player_position[0] > 0):
		return [sol, sol * gradient]
	else:
		return [-sol, -sol * gradient]


func _on_net_area_3d_area_shape_entered(_area_rid: RID, area: Area3D, _area_shape_index: int, _local_shape_index: int) -> void:
	var player = area.get_parent()
	if player.name == "Player":
		var input_vector = Vector3.ZERO
		var player_position = player.global_transform.origin
		var vector_arr = ellipse_coordinates(player_position)
		print(vector_arr)
		input_vector.x = vector_arr[0]
		input_vector.y = 8.0
		input_vector.z = vector_arr[1]
		player.global_transform.origin = input_vector
		
