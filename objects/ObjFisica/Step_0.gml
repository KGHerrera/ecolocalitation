/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
bolGround		  =	scrBolGround()
insMovilH		  = instance_place(x, y + 1, ObjMovilH)

if(!bolGround) {
	intTempAcc		= intAirAcc
	intTempFric		= intAirFric
} 
else {
	intTempAcc		= intGroundAcc
	intTempFric		= intGroundFric
}


// Velocidad sobre plataforma movil
if(instance_place(x, y + 1, ObjMovilH) and !instance_place(x, y, ObjMovilH) and !place_meeting(x + insMovilH.intVX, y, ObjBlock)){
	x += insMovilH.intVX
}

// caida libre
if (!bolGround){
	intVY = scrApproach(intVY, intVYMax, intGravityNorm)
}

// Colicion horizontal

repeat (abs(intVX)) {		
	
	// Colicion horizontal
	if(layer_exists("Collision")){
		
		if(!scrTileMeeting(x + sign(intVX), y, "Collision") and !place_meeting(x + sign(intVX), y, ObjBlock)){
			x += sign(intVX)
		} else { 
			intVX = 0; 
			break 
		}
		
		
	}
	
	else if(!place_meeting(x + sign(intVX), y, ObjBlock)){
		x += sign(intVX)
	}
	
	else { 
		intVX = 0; 
		break 
	}
	
}

// Colicion vertical
repeat (abs(intVY)) { 
	
	if(layer_exists("Collision") and scrTileMeeting(x, y + sign(intVY), "Collision" )){
			intVY = 0
			break
	}
	
    if (place_meeting(x, y + sign(intVY) ,ObjBlock)){
		intVY = 0
		break
	} else if (place_meeting(x, y + sign(intVY), ObjPlataform) and !place_meeting(x, y, ObjPlataform) and intVY >= 0){
		intVY = 0
		break
	} else if (place_meeting(x, y + sign(intVY), ObjMovilH) and !place_meeting(x, y, ObjMovilH) and intVY >= 0){
		intVY = 0
		break
	}  else if (place_meeting(x, y + sign(intVY) + 1, ObjMovilY) and !place_meeting(x, y, ObjMovilY) and intVY >= 0){
		intVY = instance_place(x, y + sign(intVY) + 1, ObjMovilY).intVY
		break
	}
	else {
		y += sign(intVY)
	}
}

if(intVX != 0){
	intVX = scrApproach(intVX, 0, 0.1);
}

