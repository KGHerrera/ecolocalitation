/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
burst = false
see = 0
select = instance_create_layer(x,y, layer, obj_select)

with (select){
	image_alpha = other.see
}

time = 0

angle_rotate = 0

wait = 0