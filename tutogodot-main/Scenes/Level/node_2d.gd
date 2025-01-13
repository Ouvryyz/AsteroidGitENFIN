extends Node2D

# Variables
var target_value := 0
var starting_value := 0
var current_value := 0
var tween_duration := 1.0 # secondes

# Références aux nœuds
@onready var label := $Label

# Mise à jour du texte du Label
func _update_label(value: float) -> void:
	label.text = str(int(value))

# Gestion de l'événement du bouton
func _on_button_pressed() -> void:
	target_value += 1000
	starting_value = current_value

	# Crée un nouveau Tween
	var tween = get_tree().create_tween()

	# Lier le Tween au noeud principal
	tween.bind_node(self)

	# Animer la propriété "current_value"
	tween.tween_property(self, "current_value", target_value, tween_duration).set_trans(Tween.TRANS_LINEAR)

	# Mettre à jour le Label pendant l'animation
	tween.tween_method(_update_label, starting_value, target_value, tween_duration).set_trans(Tween.TRANS_LINEAR)
