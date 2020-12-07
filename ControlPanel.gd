extends Panel


signal generate(source)

onready var options = get_node("OptionButton")
onready var outputs = [get_node("OutputPanelL/Output"), get_node("OutputPanelR/Output")]


func _ready():
	pass


func add_sources(sources):
	options.add_item("-- select source --")
	for source in sources:
		options.add_item(source)


func set_names(names):
	var texts = [[], []]
	for i in range(len(names)): # Argh! No enumerate!
		texts[i%2].append(names[i])
	for i in range(2):
		outputs[i].text = PoolStringArray(texts[i]).join("\n")
		print(outputs[i].text)


func _on_Button_pressed():
	if options.selected > 0:
		emit_signal("generate", options.get_item_text(options.selected))
