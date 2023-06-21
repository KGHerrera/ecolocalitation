/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(!bolFall) {
	intVY = 0
}
else {
	intVY = scrApproach(intVY, intVYMax, intGravity)
}

y += intVY

if(!bolFalling){
	sprite_index = spMovilF
} else {
	sprite_index = spMovilF2
}


if((y >= room_height + 150) and bolFall){
	alarm[1] = intTimer * 2.5
	bolFall = false
}