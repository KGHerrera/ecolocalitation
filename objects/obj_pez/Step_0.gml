/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
displacement += 0.05;
y = y + sin(displacement) * .7;
x += direccion

if(place_meeting(x + 30, y, ObjBlock) or scrTileMeeting(x + 30, y, "Collision")){
	image_xscale = -1
	direccion *= -1
} 
else if(place_meeting(x - 30, y, ObjBlock) or scrTileMeeting(x - 30, y, "Collision")){
	image_xscale = 1
	direccion *= -1
} 

