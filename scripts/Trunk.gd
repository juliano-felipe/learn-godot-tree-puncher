extends Node2D

onready var sprite = $Sprite
onready var left_axe = $LeftAxe
onready var right_axe = $RightAxe
onready var timer = $Timer

var sprite_height
var speed = 1500
var direction = 1
var has_axe = false


func _ready():
	sprite_height = sprite.texture.get_height() * scale.y
	set_process(false)


func _process(delta):
	position.x += speed * direction * delta


func init_trunk(axe, right):
	if axe:
		if right:
			left_axe.queue_free()
		else:
			right_axe.queue_free()
		has_axe = true
	else:
		left_axe.queue_free()
		right_axe.queue_free()
		has_axe = false


func remove(from_right):
	if from_right:
		direction = -1
	else:
		direction = 1
	timer.start()
	set_process(true)


func _on_Timer_timeout():
	queue_free()