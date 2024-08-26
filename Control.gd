extends Control

@onready var timer_count = $timer_container/timer_count
@onready var contador_melons = $HBoxContainer/contador as Label
@onready var clock_timer = $HBoxContainer/clock_timer as Timer




signal tempo_acabou() #para recarregar no mundo

var minutos = 0
var segundos = 0

#para limitar o tempo
@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0



func _ready():
	contador_melons.text = str("%03d" % Contador.somaPontos)
	#timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	
	minutos = min_padrao
	segundos = seg_padrao
	reset_clock_timer()
	
@warning_ignore("unused_parameter")
func _process(delta):
	contador_melons.text = str("%03d" % Contador.somaPontos)
	# minutos == 0 && segundos == 0:
	#	emit_signal("tempo_acabou")
	
	if minutos == 0 and segundos == 0:
		emit_signal("tempo_acabou")
	
func _on_clock_timer_timeout():
	if segundos == 0:
		if minutos > 0:
			minutos -=1
			segundos = 60
			
	segundos -=1
	
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
	
	
	
func reset_clock_timer():
	minutos = min_padrao
	segundos = seg_padrao
	



	
