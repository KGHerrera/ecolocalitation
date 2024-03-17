/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
burst = false
see = 0
select = instance_create_depth(x,y,1 , obj_select)

with (select){
	image_alpha = other.see
}

image_angle = 90

time = 0