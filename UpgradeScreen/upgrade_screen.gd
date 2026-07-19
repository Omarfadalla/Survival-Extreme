extends Control

@onready var label_1 = $HBoxContainer/Label
@onready var label_2 = $HBoxContainer/Label2
@onready var label_3 = $HBoxContainer/Label3
@onready var label_4 = $HBoxContainer/Label4

var Upgrades = [
	
	"bullet_Speed","Damage","Shotgun","SMG","AR","Piercing"
	,"Player_Speed","Sniper","Double_Ar","Double_Shotgun","Double_Sniper"
	,"Increased_Health","Triple_Sniper","Triple_AR","Triple_SMG"
]

var Current_options = ["","","",""]
