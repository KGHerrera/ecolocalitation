/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(!bolFall) {
	int_vy = 0
}
else {
	int_vy = scrApproach(int_vy, int_vyMax, intGravity)
}

y += int_vy

if(!bolFalling){
	sprite_index = spMovilF
} else {
	sprite_index = spMovilF2
}


if((y >= room_height + 50) and bolFall){
	alarm[1] = intTimer * 2.5
	bolFall = false
}