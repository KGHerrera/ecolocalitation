// movimientos
keyRight  =   gamepad_axis_value(0, gp_axislh)
keyLeft   =   -gamepad_axis_value(0, gp_axislh)
keyUp     =   -gamepad_axis_value(0, gp_axislv)
keyDown   =   gamepad_axis_value(0, gp_axislv)
keyJump	  =	  gamepad_button_check_pressed(0, gp_face1)
keyX	  =   gamepad_button_check(0, gp_face3)
keyA	  =   gamepad_button_check(0, gp_shoulderr)

if(isDash and intVXMax < 6){
	intVXMax = intMaxDashAcc
} else if(intVX < intVXReset and intVX > -intVXReset){
	intVXMax = intVXReset
} 


// Caida desde plataforma
if keyDown and place_meeting(x, y + 1, ObjPlataform) and !place_meeting(x, y + 1, ObjBlock) {
	y++
}

// comprobacion de coliciones
intColLeft		  = place_meeting(x - 1, y, ObjBlock) 
intColRight		  = place_meeting(x + 1, y, ObjBlock)

intColLeftNo	  = place_meeting(x - 1, y, ObjNoClimb) 
intColRightNo	  = place_meeting(x + 1, y, ObjNoClimb)

bolGround		  =	scrBolGround()
intMove			  = keyRight - keyLeft;

insMovilH = instance_place(x, y + 1, ObjMovilH)

// Aceleracion y friccion
if(!bolGround){
	intTempAcc		= intAirAcc
	intTempFric		= intAirFric
	
} else {
	
	if(isDash) { 
		intVXMax = 6 
	}
	
	gamepad_button_check_released(0, gp_face3)
	intTempAcc		= intGroundAcc
	intTempFric		= intGroundFric
	dashDuration	= maxDash
	canDash			= true	
}

// Velocidad horizontal
if (keyX and !bolGround and canDash) {
	isDash			= true
    dashDuration	-=  1
	
	intVX = scrApproach(intVX, intVXMax * intMove, intTempAcc*2)
	
	if(keyUp) {
		intVY = scrApproach(intVY, -intMaxDashAcc, intTempAcc * 4)
	}
	else if(keyDown) {
		intVY = scrApproach(intVY, intVYMax, intTempAcc * 4)
	}
	else {
		intVY	= -intGravityNorm
	}
	if (dashDuration == 0) {
		canDash = false
	}
	
	// Flashasos
	flashAlpha = 1;
	
} 

else if dashDuration != maxDash { 
	canDash = false 
	dashDuration = 0
	isDash = false 
} 

else { 
	canDash = true 
	isDash = false
}

// Flashasos
if (flashAlpha > 0) {
	flashAlpha -= 0.1
}

// friccion
if (intMove != 0){
	intVX = scrApproach(intVX, intVXMax * intMove, intTempAcc)
}
else {
	intVX = scrApproach(intVX, intVXMax * intMove, intTempFric)
}

// Velocidad sobre plataforma movil
if(instance_place(x, y+1, ObjMovilH) and !instance_place(x, y, ObjMovilH)){
	x += insMovilH.intVX 
}

// Velocidad vertical // caida libre
if (!bolGround){
	if ((intColLeft or intColRight) and (intVY >= 0) and (keyLeft or keyRight)) {
		intVY = scrApproach(intVY, intVYMax/3, intGravitySlide)
		
	}
	else {
		intVY = scrApproach(intVY, intVYMax, intGravityNorm)
	}
}

// Salto
if (bolGround and keyJump) {
	intVY = -intJumpHeight
}

// Salto pequeño
if (keyboard_check_released(ord("Z")) or gamepad_button_check_released(0, gp_face1) ){
	if(intVY < 0) {
		intVY *= 0.5
	}
}

// Colicion horizontal
repeat (abs(intVX)) {
	// Colicion horizontal
    if (!place_meeting(x + sign(intVX), y, ObjBlock)) x += sign(intVX)
	else { intVX =   0; break }
}

// Trampolines
if (place_meeting(x, y + 1, Trampolin) or  place_meeting(x, y, Trampolin)) {
	intVY = -25 * multiplicador
	keyboard_key_release(ord("X"))
	tramp = true
}

if place_meeting(x + sign(intVX), y, TrampolinX) or place_meeting(x + sign(intVX), y, TrampolinX2) {
	canDash = false
}
	
if place_meeting(x + sign(intVX), y, TrampolinX) {
	keyboard_key_release(ord("X"))
	intVY = -20 * multiplicador
	intVX = 35  * multiplicador
	tramp = true
}

if place_meeting(x + sign(intVX), y, TrampolinX2) {
	keyboard_key_release(ord("X"))
	intVY = -20 * multiplicador
	intVX = -35 * multiplicador
	tramp = true
}

if tramp {
	trampTime--
	if trampTime == 0 { 
		tramp = false
		trampTime = 20
		canDash = true
		dashDuration = maxDash
	}
}


// Colicion vertical
repeat (abs(intVY)) { 
    if (place_meeting(x, y + sign(intVY) ,ObjBlock)){
		intVY = 0
		break
	} else if (place_meeting(x, y + sign(intVY), ObjPlataform) and !place_meeting(x, y, ObjPlataform) and intVY >= 0){
		intVY = 0
		break
	} else if (place_meeting(x, y + sign(intVY), ObjMovilH) and !place_meeting(x, y, ObjMovilH) and intVY >= 0){
		intVY = 0
		break
	} else y += sign(intVY)
}
 
// Animacion
// reflejo del personaje
if (intMove != 0 and keyA) image_xscale = -intMove * spriteSize
else if (intMove != 0) image_xscale = intMove * spriteSize

if !bolGround {
	
	if (isDash and intVX == 0) {
		sprite_index = midair3
	}
	else if (isDash) {
		sprite_index = dash3	
	}
	else if (intColLeft and keyLeft and intVY > 0) {
		sprite_index = midair3
		image_xscale = spriteSize
	
	} else if (intColRight and keyRight and intVY > 0) {
		sprite_index = midair3
		image_xscale = -spriteSize
	} 	
	else sprite_index    =   jump3
}
// cambio de animacion
else {
	if(intVX != 0) sprite_index    =   walk3
    else sprite_index			   =   stand3
} 

// Funcionalidad de X
if intColLeft or intColRight { 
	canDash = false 
	keyboard_key_release(ord("X")) 
}

// Salto en la pared
if(intColLeft and keyJump and !bolGround and !intColLeftNo){
	canDash = true
	dashDuration = maxDash
	
	//if (keyUp) { intVX = intVXMax * 3; intVY = -intJumpHeight * 1.2 }
	if(intMove < 0){ intVX = intVXMax * 1; intVY = -intJumpHeight * 1 } 
	//else{ intVX = intVXMax * 2; intVY = -intJumpHeight * 1.2 }
}

if(intColRight and keyJump and !bolGround and !intColRightNo){
	canDash = true
	dashDuration = maxDash
	
	//if (keyUp) { intVX = -intVXMax * 3; intVY = -intJumpHeight * 1.2 }
	if(intMove > 0){ intVX = -intVXMax * 1; intVY = -intJumpHeight * 1}
	// else { intVX = -intVXMax * 2; intVY = -intJumpHeight * 1.2 }
}


//if(intColLeft or intColRight) {keyboard_key_release(ord("X"))}



//// colicion enemigos
//if (place_meeting(x-2, y-2, ObjPez) or place_meeting(x-2, y-2, ObjZeta) or place_meeting(x-2, y-2, ObjGhost) and ObjGhost.image_alpha >= 1) and regeneration == maxRegeneration{
//	enemyColition = true
//	vidas--
//	intVX = 15 * -intMove * multiplicador
//	intVY = -15 * multiplicador
//	keyboard_key_release(ord("X"))
//}

//if enemyColition {
//	regeneration--
//	image_alpha = 0.5
//	if regeneration == 0 {
//		regeneration = maxRegeneration
//		enemyColition = false
//		image_alpha = 1
//	}
//}

if (vidas == 0 or y >= room_height + 400 or keyboard_check_pressed(ord("R"))) { 
	room_restart()
}