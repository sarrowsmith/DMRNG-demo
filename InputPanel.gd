extends Panel


onready var done = get_node("Done")


func _ready():
	done.disabled = true


func _on_Button_pressed():
	pass # Replace with function body.
