extends Panel
class_name MiniGamePopup

signal closeWithoutSuccess
signal closeWithSuccess

func _onCloseButtonPressed() -> void:
	closeWithoutSuccess.emit()

func onMiniGameSuccess():
	closeWithSuccess.emit()
