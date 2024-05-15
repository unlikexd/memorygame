extends Control


@onready var icon = $InnerBorder/ItemIcon
@onready var details_panel = $DetailsPanel
@onready var item_name = $DetailsPanel/ItemName
@onready var item_description = $DetailsPanel/Description

# Slot item
var item = null

func _on_item_button_mouse_entered():
	if item != null:
		details_panel.visible = true


func _on_item_button_mouse_exited():
	details_panel.visible = false


func set_empty():
	icon.texture = null


func set_item(new_item):
	item = new_item
	icon.texture = new_item["texture"]
	item_name.text = str(item["name"])
	item_description.text = str(item["description"])
	
