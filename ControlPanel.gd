extends Panel


signal generate(source)
signal add_source()

onready var options = get_node("OptionButton")
onready var outputs = [get_node("OutputPanelL/Output"), get_node("OutputPanelR/Output")]


func _ready():
	pass


func set_sources(sources):
	options.clear()
	options.add_item("-- select source --")
	options.add_separator()
	for source in sources:
		options.add_item(source)
	options.add_separator()
	options.add_item("-- add source --")


func set_names(names):
	var texts = [[], []]
	for i in range(len(names)): # Argh! No enumerate!
		texts[i%2].append(names[i])
	for i in range(2):
		outputs[i].text = PoolStringArray(texts[i]).join("\n")


func _on_Button_pressed():
	if options.selected > 0:
		if options.selected == options.get_item_count() - 1:
			emit_signal("add_source")
		else:
			emit_signal("generate", options.get_item_text(options.selected))


func _on_OptionButton_item_selected(index):
	if index == options.get_item_count() - 1:
		emit_signal("add_source")
