extends ParallaxBackground

@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")
@export var scroll_speed = 15 

@onready var sprite = $ParallaxLayer/Sprite2D

func _ready():
	sprite.texture = bg_texture

func _process(delta):
	if Input.is_action_pressed("move_left"):
		sprite.region_rect.position += delta * Vector2(scroll_speed, -scroll_speed)
	elif Input.is_action_pressed("move_right"):
		sprite.region_rect.position += delta * Vector2(-scroll_speed, -scroll_speed)
	else:
		sprite.region_rect.position += delta * Vector2(0, -scroll_speed)
	
	if sprite.region_rect.position >= Vector2(64, 64):
		sprite.region_rect.position = Vector2.ZERO
