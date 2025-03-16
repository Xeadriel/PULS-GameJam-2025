extends InteractibleObject

var oneTileToTheSide = Vector2.UP*32 + Vector2.LEFT *32
const SPEED = 100

@onready var successLabel = $SuccessLabel
@onready var failLabel = $FailLabel
var failLabelTimeOut = 3
var failLabelTimer = 0

func _ready() -> void:
	super._ready()
	set_physics_process(false)
	oneTileToTheSide += position 

func _process(delta: float) -> void:
	super._process(delta)
	if failLabel.visible:
		failLabelTimer += delta
		if failLabelTimer >= failLabelTimeOut:
			failLabelTimer = 0
			failLabel.hide()

func _physics_process(delta: float) -> void:
	position = position.move_toward(oneTileToTheSide, delta*100)

func onMinigameSuccess():
	set_physics_process(true)
	set_process(false)
	interactLabel.hide()
	destroyLabel.hide()
	failLabel.hide()
	animatedSprite.play("good")
	successLabel.show()

func onMinigameFail():
	failLabel.show()
