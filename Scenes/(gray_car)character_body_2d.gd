class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.ZERO
var direction : Vector2 = Vector2.ZERO

@onready var ani_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : player_state_machine = $StateMachine


func _ready():
	state_machine.Initialize(self)
	ani_sprite.play("idle")
	pass

func _process(delta):
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()

func SetDirection() -> bool:
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return true
	
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	ani_sprite.scale.x = -1 if cardinal_direction == Vector2.RIGHT else 1
	return true


func UpdateAnimation() -> void:
	ani_sprite.play(AnimationType())
	pass


func AnimationType() -> String:
	if direction == Vector2.ZERO:
		return "Idle"
	elif direction == Vector2.LEFT or direction == Vector2.RIGHT:
		return "Walk"
	elif direction == Vector2.DOWN:
		return "Down"
	else:
		return "Up"
