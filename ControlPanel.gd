extends Panel


signal generate(source)

onready var options = get_node("OptionButton")


func _ready():
	pass


func add_sources(sources):
	options.add_item("-- select source --")
	for source in sources:
		options.add_item(source)

func _on_Button_pressed():
	if options.selected > 0:
		emit_signal("generate", options.get_item_text(options.selected))
