extends Panel


signal new_source(description, source)

onready var done = get_node("Done")
onready var description = get_node("LineEdit")
onready var source = get_node("TextEdit")


func _ready():
	done.disabled = true


func _on_LineEdit_text_changed(_new_text):
	_on_TextEdit_text_changed()


func _on_TextEdit_text_changed():
	var count = 0
	for line in source.text.split("\n"):
		line = line.strip_edges()
		if len(line) > 0:
			count += len(line.split(" "))
	done.disabled = not (
		count >= 20 and
		len(description.text.strip_edges()) > 0
	)


func _on_Done_pressed():
	var ev = InputEventAction.new()
	ev.action = "ui_cancel"
	ev.pressed = true
	Input.parse_input_event(ev)
	emit_signal("new_source", description.text.strip_edges(), source.text.strip_edges())
