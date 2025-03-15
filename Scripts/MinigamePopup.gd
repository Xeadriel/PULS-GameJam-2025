extends Panel
class_name MiniGamePopup

signal closeWithoutSuccess
signal closeWithSuccess
signal startMinigame

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
