/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if place_meeting(x,y, obj_player){
	with(obj_player){
		if(isPlaning and other.cont >= 15){
			if(int_vy > - 10) int_vy += -1
		} else if(isPlaning){
			other.cont++
		}

	} 
}
else {
	cont = 0
}