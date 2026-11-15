extends Node
var money:=0
var doubl:=0
var max:=1.5
var slip:=0.9
var dif:=0
var fill:=0.05
var height:=0
@onready var glas:=$glas
var carot:=1
func reset():
	money=0
	doubl=0
	max=1.5
	slip=0.9
	dif=0
	fill=0.05
	height=0
	carot=1
	
func buy(a : String):
	$buy.play()
	dif+=1
	match a:
		"jump":
			doubl+=1
		"glutton":
			carot+=1
		"breaker":
			max+=0.1
		"firm":
			if slip>0:
				slip-=0.1
		"charge":
			fill+=0.05
