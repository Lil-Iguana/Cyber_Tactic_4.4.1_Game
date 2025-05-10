extends ThreadPassive

var already_initialized := false


func initialize_thread(owner: ThreadUI) -> void:
	# makes sure we don't have extra mana when we
	# keep saving and loading the game
	if already_initialized:
		return

	var run := owner.get_tree().get_first_node_in_group("run") as Run
	run.character.max_mana += 1
	run.character.mana = run.character.max_mana
	already_initialized = true


func activate_thread(owner: ThreadUI) -> void:
	owner.get_tree().call_group("intent", "set", "modulate", Color.TRANSPARENT)


func deactivate_thread(owner: ThreadUI) -> void:
	print("woohoo")
	var run := owner.get_tree().get_first_node_in_group("run") as Run
	run.character.max_mana -= 1
