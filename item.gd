extends Area2D

@onready var animation = $AnimatedSprite2D



func _on_body_entered(body):
	if body.name == "player":
		
		
		$item_sprite.play("collected")
		await $item_sprite.animation_finished	
		Contador.somaPontos =1
		print("pegou")
		
		
		
		queue_free()

