
end_ = false

inst = instance_create_layer(x, y, "Instances", ObjBoton);

with(inst){
	x = other.x;
	y = other.y - 64;
}