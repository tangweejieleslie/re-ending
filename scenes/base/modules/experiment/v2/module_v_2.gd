extends Control

var base_module = load("res://scenes/base/modules/experiment/v2/base_module.gd") as BaseModule


func _ready() -> void:
	var bm = BaseModule.new()
	bm.randomize_module([0,1],[0,1],1)
	pass


func _on_randomize_pressed() -> void:
	var bm = BaseModule.new()
	bm.randomize_module([0,1],[0,1],1)
