extends Sprite2D

@export var enemyShipSpawner : PackedScene = null

@export var enemyShipCount = 20
var shipsLeft = 20
var enemyShipDeathCount = 0
@export var spawnRate = 1
var spawnTimer = 0
var hp = 3

@onready var spawnLocations = [$SpawnLocation1, $SpawnLocation2, $SpawnLocation3]
@onready var hpLabel = $HPLabel
@onready var enemies = $Enemies
@onready var bullets = get_parent().get_node("Bullets")
var turretBarrel = null

signal lose
signal win

func _ready():
	shipsLeft = enemyShipCount
	turretBarrel = get_parent().get_node("TurretBarrel")
	set_process(false)
	turretBarrel.set_process(false)
	

func _process(delta: float) -> void:
	spawnTimer += delta
	if spawnTimer >= 1 and shipsLeft > 0:
		spawnTimer = 0
		shipsLeft -= 1
		
		var spawnLocation = spawnLocations[randi_range(0, 2)] 
		
		var enemyShip : EnemyShip = enemyShipSpawner.instantiate()
		enemies.add_child(enemyShip)
		enemyShip.escaped.connect(getHit)
		enemyShip.died.connect(enemyDied)
		enemyShip.position = spawnLocation.position
	
func getHit():
	if not is_processing():
		return
	
	hp -= 1
	if hp <= 0:
		hp = 3
		lose.emit()
	
	hpLabel.text = str(hp) + " HP"

func enemyDied():
	if not is_processing():
		return
	
	enemyShipDeathCount +=1
	if enemyShipDeathCount == enemyShipCount:
		win.emit()

func startMinigame():
	set_process(true)
	turretBarrel.set_process(true)

func stopMinigame():
	shipsLeft = enemyShipCount
	enemyShipDeathCount = 0
	hp = 3
	hpLabel.text = str(hp) + " HP"
	spawnTimer = 0
	
	var enemiesArray = enemies.get_children()
	for enemy in enemiesArray:
		enemy.queue_free()
	
	var bulletsArray = bullets.get_children()
	for bullet in bulletsArray:
		bullet.queue_free()
	
	set_process(false)
	turretBarrel.set_process(false)
