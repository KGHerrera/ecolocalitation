/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
displacement += 0.2;
y = y + sin(displacement) * 0.2;
x += direccion

if(place_meeting(x + 30, y, ObjBlock)){
	image_xscale = -1
	direccion *= -1
} 
else if(place_meeting(x - 30, y, ObjBlock)){
	image_xscale = 1
	direccion *= -1
} 

