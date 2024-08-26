extends Node2D

var somaPontos = 0

@onready var player = $player
@onready var control = $HUD/Control


# Called when the node enters the scene tree for the first time.
func _ready():
	player.morreu.connect(resetar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func resetar():
	print("resetou")
	get_tree().reload_current_scene()

