extends Panel
class_name MiniGamePopup

var chosenBlock = null


signal closeWithoutSuccess
signal closeWithSuccess

func _onCloseButtonPressed() -> void:
	closeWithoutSuccess.emit()

func onMiniGameSuccess():
	closeWithSuccess.emit()
