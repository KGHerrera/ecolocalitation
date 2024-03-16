
inst = instance_create_layer(x, y - 16 * 4, "Instances", obj_boton)

with(inst){
	x = other.x;
	y = other.y - 32;
}

play = false
end_ = false

mensaje = "No llevas objetos de este tipo"
showMesaje = false

suma = 0