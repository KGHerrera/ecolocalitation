// movimientos
keyRight  =   gamepad_axis_value(0, gp_axislh)
keyLeft   =   -gamepad_axis_value(0, gp_axislh)
keyUp     =   -gamepad_axis_value(0, gp_axislv)
keyDown   =   gamepad_axis_value(0, gp_axislv)
keyJump	  =	  gamepad_button_check_pressed(0, gp_face1)
keyX	  =   gamepad_button_check(0, gp_face3)
keyA	  =   gamepad_button_check(0, gp_shoulderr)

if(isDash and int_vxMax < 6){
	int_vxMax = intMaxDashAcc
} else if(int_vx < int_vxReset and int_vx > -int_vxReset){
	int_vxMax = int_vxReset
} 


// Caida desde plataforma
if keyDown and place_meeting(x, y + 1, obj_plataforma) and !place_meeting(x, y + 1, obj_block) {
	y++
}

// comprobacion de coliciones
intColLeft		  = place_meeting(x - 1, y, obj_block) 
intColRight		  = place_meeting(x + 1, y, obj_block)

intColLeftNo	  = place_meeting(x - 1, y, obj_no_escalar) 
intColRightNo	  = place_meeting(x + 1, y, obj_no_escalar)

bolGround		  =	scrBolGround()
int_move			  = keyRight - keyLeft;

insMovilH = instance_place(x, y + 1, obj_plat_movil_horizontal)

// Aceleracion y friccion
if(!bolGround){
	intTempAcc		= intAirAcc
	intTempFric		= intAirFric
	
} else {
	
	if(isDash) { 
		int_vxMax = 6 
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
	
	int_vx = scrApproach(int_vx, int_vxMax * int_move, intTempAcc*2)
	
	if(keyUp) {
		int_vy = scrApproach(int_vy, -intMaxDashAcc, intTempAcc * 4)
	}
	else if(keyDown) {
		int_vy = scrApproach(int_vy, int_vyMax, intTempAcc * 4)
	}
	else {
		int_vy	= -intGravityNorm
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
if (int_move != 0){
	int_vx = scrApproach(int_vx, int_vxMax * int_move, intTempAcc)
}
else {
	int_vx = scrApproach(int_vx, int_vxMax * int_move, intTempFric)
}

// Velocidad sobre plataforma movil
if(instance_place(x, y+1, obj_plat_movil_horizontal) and !instance_place(x, y, obj_plat_movil_horizontal)){
	x += insMovilH.int_vx 
}

// Velocidad vertical // caida libre
if (!bolGround){
	if ((intColLeft or intColRight) and (int_vy >= 0) and (keyLeft or keyRight)) {
		int_vy = scrApproach(int_vy, int_vyMax/3, intGravitySlide)
		
	}
	else {
		int_vy = scrApproach(int_vy, int_vyMax, intGravityNorm)
	}
}

// Salto
if (bolGround and keyJump) {
	int_vy = -intJumpHeight
}

// Salto pequeño
if (keyboard_check_released(ord("Z")) or gamepad_button_check_released(0, gp_face1) ){
	if(int_vy < 0) {
		int_vy *= 0.5
	}
}

// Colicion horizontal
repeat (abs(int_vx)) {
	// Colicion horizontal
    if (!place_meeting(x + sign(int_vx), y, obj_block)) x += sign(int_vx)
	else { int_vx =   0; break }
}

// Trampolines
if (place_meeting(x, y + 1, obj_trampolin_abajo) or  place_meeting(x, y, obj_trampolin_abajo)) {
	int_vy = -25 * multiplicador
	keyboard_key_release(ord("X"))
	tramp = true
}

if place_meeting(x + sign(int_vx), y, obj_trampolin_izquierda) or place_meeting(x + sign(int_vx), y, obj_trampolin_derecha) {
	canDash = false
}
	
if place_meeting(x + sign(int_vx), y, obj_trampolin_izquierda) {
	keyboard_key_release(ord("X"))
	int_vy = -20 * multiplicador
	int_vx = 35  * multiplicador
	tramp = true
}

if place_meeting(x + sign(int_vx), y, obj_trampolin_derecha) {
	keyboard_key_release(ord("X"))
	int_vy = -20 * multiplicador
	int_vx = -35 * multiplicador
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
repeat (abs(int_vy)) { 
    if (place_meeting(x, y + sign(int_vy) ,obj_block)){
		int_vy = 0
		break
	} else if (place_meeting(x, y + sign(int_vy), obj_plataforma) and !place_meeting(x, y, obj_plataforma) and int_vy >= 0){
		int_vy = 0
		break
	} else if (place_meeting(x, y + sign(int_vy), obj_plat_movil_horizontal) and !place_meeting(x, y, obj_plat_movil_horizontal) and int_vy >= 0){
		int_vy = 0
		break
	} else y += sign(int_vy)
}
 
// Animacion
// reflejo del personaje
if (int_move != 0 and keyA) image_xscale = -int_move * spriteSize
else if (int_move != 0) image_xscale = int_move * spriteSize

if !bolGround {
	
	if (isDash and int_vx == 0) {
		sprite_index = midair3
	}
	else if (isDash) {
		sprite_index = dash3	
	}
	else if (intColLeft and keyLeft and int_vy > 0) {
		sprite_index = midair3
		image_xscale = spriteSize
	
	} else if (intColRight and keyRight and int_vy > 0) {
		sprite_index = midair3
		image_xscale = -spriteSize
	} 	
	else sprite_index    =   jump3
}
// cambio de animacion
else {
	if(int_vx != 0) sprite_index    =   walk3
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
	
	//if (keyUp) { int_vx = int_vxMax * 3; int_vy = -intJumpHeight * 1.2 }
	if(int_move < 0){ int_vx = int_vxMax * 1; int_vy = -intJumpHeight * 1 } 
	//else{ int_vx = int_vxMax * 2; int_vy = -intJumpHeight * 1.2 }
}

if(intColRight and keyJump and !bolGround and !intColRightNo){
	canDash = true
	dashDuration = maxDash
	
	//if (keyUp) { int_vx = -int_vxMax * 3; int_vy = -intJumpHeight * 1.2 }
	if(int_move > 0){ int_vx = -int_vxMax * 1; int_vy = -intJumpHeight * 1}
	// else { int_vx = -int_vxMax * 2; int_vy = -intJumpHeight * 1.2 }
}


//if(intColLeft or intColRight) {keyboard_key_release(ord("X"))}



//// colicion enemigos
//if (place_meeting(x-2, y-2, ObjPez) or place_meeting(x-2, y-2, ObjZeta) or place_meeting(x-2, y-2, ObjGhost) and ObjGhost.image_alpha >= 1) and regeneration == maxRegeneration{
//	enemyColition = true
//	vidas--
//	int_vx = 15 * -int_move * multiplicador
//	int_vy = -15 * multiplicador
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