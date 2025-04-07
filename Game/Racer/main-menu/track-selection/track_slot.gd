extends Panel

@export var track_path: String
@export var track_texture: CompressedTexture2D


func _ready():
	$TextureRect.texture = track_texture


func set_selected(boolean):
	var stylebox = get_theme_stylebox("panel").duplicate()
	
	if boolean:
		stylebox.border_color = Color(1,1,1)
	else:
		stylebox.border_color = Color(0,0,0)
	
	add_theme_stylebox_override("panel", stylebox)
