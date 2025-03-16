extends Panel
class_name MiniGamePopup

var chosenBlock = null


signal closeWithoutSuccess
signal closeWithSuccess
signal startMinigame

@onready var connected = []
@onready var startPipe = $Start

func _ready() -> void:
	connected.append(startPipe)

func onMinigameStart():
	startMinigame.emit()
	visible = true

func _onCloseButtonPressed() -> void:
	closeWithoutSuccess.emit()
	visible = false

func onMiniGameSuccess():
	closeWithSuccess.emit()
	visible = false

func onMiniGameFail():
	closeWithoutSuccess.emit()
	visible = false

func _on_control_2_is_won() -> void:
	queue_free()
