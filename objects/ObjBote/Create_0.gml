
inst = instance_create_layer(x, y - 16 * 4, "Instances", ObjBoton)

with(inst){
	x = other.x;
	y = other.y - 32;
}

play = false
end_ = false

mensaje = "No llevas objetos de este tipo"

suma = 0