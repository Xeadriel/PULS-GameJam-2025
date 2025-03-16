extends Sprite2D

@export var enemyShipSpawner : PackedScene = null

@export var enemyShipCount = 5
var shipsLeft = 20
var enemyShipDeathCount = 0
@export var spawnRate = 1
var spawnTimer = 0
var hp = 3

@onready var spawnLocations = [$SpawnLocation1, $SpawnLocation2, $SpawnLocation3]
@onready var hpLabel = $HPLabel

signal lose
signal win

func _ready():
	shipsLeft = enemyShipCount
	set_process(false)

func _process(delta: float) -> void:
	spawnTimer += delta
	if spawnTimer >= 1 and shipsLeft > 0:
		spawnTimer = 0
		shipsLeft -= 1
		
		var spawnLocation = spawnLocations[randi_range(0, 2)] 
		
		var enemyShip : EnemyShip = enemyShipSpawner.instantiate()
		add_child(enemyShip)
		enemyShip.escaped.connect(getHit)
		enemyShip.died.connect(enemyDied)
		enemyShip.position = spawnLocation.position
	
func getHit():
	hp -= 1
	if hp <= 0:
		hp = 3
		lose.emit()
	
	hpLabel.text = str(hp) + " HP"

func enemyDied():
	enemyShipDeathCount +=1
	if enemyShipDeathCount == enemyShipCount:
		win.emit()

func startMinigame():
	set_process(true)
