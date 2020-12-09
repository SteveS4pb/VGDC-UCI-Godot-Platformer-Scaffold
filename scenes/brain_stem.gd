extends Node2D


func _ready():
	$Terminal_PrefrontalCortex.terminal_location = 'prefrontal_cortex'
	$Terminal_TemporalLobe.terminal_location = 'temporal_lobe'
	$Terminal_future.terminal_location = 'future'
