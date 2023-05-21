extends Node

signal Maxima_alterada(Nova_maxima)
signal Mudar(Nova_quantidade)
signal Esgotadda


func _ready():
	_inicializar()

@export var Quantidade_maxima = 10:
	set(Nova_maxima):
		Quantidade_maxima = Nova_maxima
		Quantidade_maxima = max(1, Nova_maxima)
		emit_signal("Maxima_alterada", Quantidade_maxima)
		
@onready var Atual = Quantidade_maxima:
	set(Novo_valor):
		Atual = Novo_valor
		Atual = clamp(Atual, 0, Quantidade_maxima)
		emit_signal("Mudar", Atual)
		
		if Atual == 0:
			emit_signal("Esgotadda")
			
func _inicializar():
	emit_signal("Maxima_alterada", Quantidade_maxima)
	emit_signal("Mudar", Atual) 
