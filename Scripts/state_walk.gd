class_name State_Walk extends State

@export var move_speed : float = 210.0

@onready var idle: State = $"../Idle"

## What happens when the player enters this State?
func Enter() -> void:
	player.UpdateAnimation()
	pass

## What happens when the player exits this State?
func Exit() -> void:
	pass

## What happens during the process update in this State?
func Process( _delta : float ) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation()
	
	return null
	
## What happens during the physics process update in this State?
func Physics( _delta : float ) -> State:
	return null

## What happens with input events in this State?
func HandleInput( _event: InputEvent ) -> State:
	return null
