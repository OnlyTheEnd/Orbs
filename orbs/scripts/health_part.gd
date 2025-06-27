extends Node2D
class_name HealthPart
@export var MAXHEALTH := 10.0
@export var shieldcolor := Color()

@onready var healthbar :Control = $Healthbar/HEALTHBAR

signal onhealthchanged
signal deathsignal

var SHIELD := 0.0
var CURRHEALTH : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CURRHEALTH = MAXHEALTH
	healthbar.value = CURRHEALTH
	healthbar.max_value = MAXHEALTH
	healthbar.visible = true

func _process(delta: float) -> void:
	if SHIELD != 0:
		healthbar.tint_over = shieldcolor
	else:
		healthbar.tint_over = Color(0,0,0,0)
	
func damage(attack):
	CURRHEALTH -= attack
	healthbar.value = CURRHEALTH
	#healthbar.visible = true
	emit_signal("onhealthchanged")
	if CURRHEALTH <= 0:
		get_parent().queue_free()

func shielddamage(attack):
	var remSHIELD = SHIELD - attack
	if remSHIELD > 0:
		return
	else:
		damage(-remSHIELD)

func removeshield():
	SHIELD = 0

func heal(heal):
	CURRHEALTH += heal
	healthbar.value = CURRHEALTH
	emit_signal("onhealthchanged")

func shieldup(shield):
	SHIELD += shield
	

func scaleratio() -> float:
	var rescale = CURRHEALTH / MAXHEALTH 
	var newscale = max(0.1, rescale)
	return newscale




func _on_hurtbox_part_area_entered(area: Hurtbox) -> void:
		damage(area.damage)
