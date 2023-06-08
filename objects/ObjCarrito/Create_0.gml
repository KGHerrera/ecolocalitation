/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
inst = instance_create_layer(x, y - 16 * 4, "Instances", ObjBoton);

with(inst){
	x = other.x;
	y = other.y - 32;
}