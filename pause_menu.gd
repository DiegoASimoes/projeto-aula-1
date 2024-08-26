extends CanvasLayer
@onready var level = $".."
var game_paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

func _on_bt_quit_pressed():
	get_tree().quit() #sair do jogo


func _on_bt_voltar_pressed():
	get_tree().paused = false
	visible = false
	
	
func _on_bt_reiniciar_pressed():
	get_tree().paused = false
	level._resetar()


	

