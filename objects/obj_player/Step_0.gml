
// movimientos

if(!talking){
	if (!(coldown_right > 0)) {
		keyRight  = keyboard_check(ord("L")) or gamepad_axis_value(0, gp_axislh) or keyboard_check(vk_right) or gamepad_button_check(0, gp_padr)
		
	} else coldown_right--
	if (!(coldown_left > 0)) {
		keyLeft   = keyboard_check(ord("J")) or -gamepad_axis_value(0, gp_axislh) or keyboard_check(vk_left) or gamepad_button_check(0, gp_padl)
		
	} else coldown_left--
	keyUp     = keyboard_check(ord("I")) or -gamepad_axis_value(0, gp_axislv) or keyboard_check(vk_up) or gamepad_button_check(0, gp_padu)
	keyDown   = keyboard_check(ord("K")) or gamepad_axis_value(0, gp_axislv) or keyboard_check(vk_down) or gamepad_button_check(0, gp_padd)
	keyJump	  =	  keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1)
	keyX	  =   keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderl)
	keyA	  =   keyboard_check_pressed(ord("C")) or gamepad_button_check_pressed(0, gp_shoulderr) 
} else {
	keyRight  =   0
	keyLeft   =   0
	keyUp     =   0
	keyDown   =   0
	keyJump	  =	  0	
	keyX	  =   0
	keyA	  =   0
}


// cosas del timer
if(keyRight or keyLeft or keyJump){
	startTimer = true
}

if (!ObjControl.end_ && startTimer) {
    timeElapsed += delta_time / room_speed / 10000;
}

// velocidades dinamicas
/*
if(abs(int_vx) >= intMaxDashAcc){
	lose_speed = 20
}

else{
	
	if(lose_speed > 0){
		lose_speed--
	}
}
*/

if(int_vxMax > intMaxGroundDash){
	int_vxMax = scrApproach(int_vxMax, intMaxGroundDash, 0.01);
}

if(isDashing and int_vxMax < intMaxGroundDash){
	int_vxMax = intMaxDashAcc
} else if(abs(int_vx) < int_vxReset){
	int_vxMax = int_vxReset
} 


// Caida desde plataforma
if keyDown and place_meeting(x, y + 1, ObjPlataform) and !place_meeting(x, y + 1, ObjBlock) {
	y++
}

// comprobacion de coliciones
intColLeft		  = place_meeting(x - 1, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x - 1, y, "Collision"))
intColRight		  = place_meeting(x + 1, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x + 1, y, "Collision"))

intColLeftJump = place_meeting(x - 5, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x - 5, y, "Collision"))
intColRightJump = place_meeting(x + 5, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x + 5, y, "Collision"))

intColLeftNo	  = place_meeting(x - 10, y, ObjNoClimb) 
intColRightNo	  = place_meeting(x + 10, y, ObjNoClimb)

bolGround		  =	scrBolGround()
int_move			  = keyRight - keyLeft;

insMovilH		  = instance_place(x, y + 1, ObjMovilH)
//insMovilY		  = instance_place(x, y + 3, ObjMovilY)
insMovilF		  = instance_place(x, y + 1, ObjMovilF)

bol_surface = place_meeting(x, y, ObjWater)

if(!bol_surface){

// Aceleracion y friccion
	if(!bolGround) {
		intTempAcc		= intAirAcc
		intTempFric		= intAirFric
		
		if(lose_jump < max_jump_time){
			lose_jump += 1
		}
		
	
	} else {
		intTempAcc		= intGroundAcc
		intTempFric		= intGroundFric
		
		lose_jump = 0
	
		if(isDashing and int_vxMax < intMaxGroundDash) { 
			int_vxMax = intMaxGroundDash
		}
	
		isDashing = false
		isPlaning = false
		jump = false
		dashDuration	= maxDash
		canDash			= true	
		
	}

} else {
	if(!bolGround){
		intTempAcc = intWaterAcc
		intTempFric = intWaterFric
		
		
		
	} else{
		intTempAcc = intGroundAccW
		intTempFric = intGroundFricW
		
		
	}
}

// Velocidad horizontal
if((keyJump )and !bolGround and canDash and !intColLeft and !intColRight and lose_jump = max_jump_time){
	isDashing = true
}


if (isDashing) {
	
	canDash = false
	
	if(dashDuration == maxDash - 1){
		audio_play_sound(snd_dash, 12, false, 1, .3, .8)
		flashAlpha = 1
	}
	
    dashDuration	-=  1
	
	
	
	// trail effect
	coldown_right = 0
	coldown_left = 0

	if(dashDuration % 3 == 0){
		with(instance_create_layer(x, y, "Instances", ObjTrail)) {
			
			sprite_index = other.sprite_index
			image_blend = c_white
			image_alpha = 0.3
			image_xscale = other.spriteSize * other.int_move
			image_yscale = other.spriteSize
		}
	}

	
	
	int_vx = scrApproach(int_vx, int_vxMax * int_move, intTempAcc * 2)
	
	if(keyUp) {
		int_vy = scrApproach(int_vy, -intMaxDashAcc, intTempAcc * 4)
	}
	else if(keyDown) {
		int_vy = scrApproach(int_vy, intMaxDashAcc, intTempAcc * 4)
	}
	else {
		int_vy = -intGravityNorm
	}
	
	if (dashDuration == 0 or keyboard_check_released(ord("X")) or gamepad_button_check_released(0, gp_face3) or keyboard_check_released(ord("Z")) or gamepad_button_check_released(0, gp_face1)) {
		isDashing = false
	}
	
} 

else if (dashDuration != maxDash) { 
	canDash = false 
	dashDuration = 0
	isDashing = false
} 

else { 
	canDash = true 
	isDashing = false
}

// friccion

if(!bol_surface){
	if (int_move != 0){
		int_vx = scrApproach(int_vx, int_vxMax * int_move, intTempAcc)
	}
	else {
		int_vx = scrApproach(int_vx, int_vxMax * int_move, intTempFric)
	}
} else {
	if (int_move != 0){
		int_vx = scrApproach(int_vx, int_vxMaxW * int_move, intTempAcc)
	}
	else {
		int_vx = scrApproach(int_vx, int_vxMaxW * int_move, intTempFric)
	}
}



// Velocidad sobre plataforma movil
if(instance_place(x, y + 1, ObjMovilH) and !instance_place(x, y, ObjMovilH) and !place_meeting(x + insMovilH.int_vx, y, ObjBlock) and !scrTileMeeting(x + insMovilH.int_vx, y, "Collision")){
	x += insMovilH.int_vx
}

// Velocidad vertical // caida libre
if(!bol_surface) {
	if (!bolGround){
		if ((intColLeft or intColRight) and (int_vy >= 0) and (keyLeft or keyRight)) {
			int_vy = scrApproach(int_vy, int_vyMax/2, intGravitySlide)
		}
		else {
			int_vy = scrApproach(int_vy, int_vyMax, intGravityNorm)
		}
	}

} else {
	
	if (!bolGround){
		
		int_vy = scrApproach(int_vy, int_vyMaxW, intGravityWater)
		
	}
	
}


//salto
if(!bol_surface){
	if ((bolGround or lose_jump < max_jump_time) and keyJump) {
		int_vy = -intJumpHeight
		lose_jump = max_jump_time
		jump = true
	}
} else {
	
	if(keyJump and keyDown){
		int_vy = intJumpHeightW - 2
		audio_play_sound(snd_splash, 0, false)
		
	}
	
	else if (keyJump) {
		int_vy = -intJumpHeightW
		audio_play_sound(snd_splash, 0, false)
	}
	
}

// Salto pequeño
if (keyboard_check_released(ord("Z")) or gamepad_button_check_released(0, gp_face1)){
	if(int_vy < 0 and !bolGround and jump) {
		int_vy *= 0.5
	}
}

// Colicion horizontal

repeat (abs(int_vx)) {		
	
	// Colicion horizontal
	if(layer_exists("Collision")){
		
		if(!scrTileMeeting(x + sign(int_vx), y, "Collision") and !place_meeting(x + sign(int_vx), y, ObjBlock)){
			x += sign(int_vx)
		} else { 
			int_vx = 0; 
			break 
		}
		
		
	}
	
	else if(!place_meeting(x + sign(int_vx), y, ObjBlock)){
		x += sign(int_vx)
	}
	
	else { 
		int_vx = 0; 
		break 
	}
	
}

// Colicion vertical
repeat (abs(int_vy)) { 
	
	if(layer_exists("Collision") and scrTileMeeting(x, y + sign(int_vy), "Collision" )){
			int_vy = 0
			break
	}
	
    if (place_meeting(x, y + sign(int_vy) ,ObjBlock)){
		int_vy = 0
		break
	} else if (place_meeting(x, y + sign(int_vy), ObjPlataform) and !place_meeting(x, y, ObjPlataform) and int_vy >= 0){
		int_vy = 0
		break
	}
	
	else if (place_meeting(x, y + sign(int_vy), ObjMovilF) and !place_meeting(x, y, ObjMovilF) and int_vy >= 0){
		int_vy = 0
		break
	}
	
	else if (place_meeting(x, y + sign(int_vy), ObjMovilH) and !place_meeting(x, y, ObjMovilH) and int_vy >= 0){
		int_vy = 0
		break
	}  
	
	else if (place_meeting(x, y + sign(int_vy) + 1, ObjMovilY) and !place_meeting(x, y, ObjMovilY) and int_vy >= 0){
		int_vy = instance_place(x, y + sign(int_vy) + 1, ObjMovilY).int_vy
		break
	}
	else {
		y += sign(int_vy)
	}
}

// plataformas que se caen
if(int_vy >= 0 and insMovilF != noone){
	with(insMovilF){
		if(!bolFalling and obj_player.y <= y){
			bolFalling = true
			alarm[0] = intTimer
		}
	}
}
 
// Animacion
// reflejo del personaje
if (int_move != 0) {
	image_xscale = int_move * spriteSize
}

if(bol_surface){
	
	sprite_index = swim2
	
} else if !bolGround {	
	if (isDashing and int_vx == 0) {
		sprite_index = midair2
	}
	else if (isDashing) {
		sprite_index = dash2	
	} else if(isPlaning){
		sprite_index = take
	}
	else if (intColLeft and keyLeft and int_vy > 0) {
		sprite_index = midair2
		image_xscale = spriteSize
	
	} else if (intColRight and keyRight and int_vy > 0) {
		sprite_index = midair2
		image_xscale = -spriteSize
	} 	
	else {
		sprite_index = jumpFast
	}
}
// cambio de animacion
else {
	if(int_vx != 0) { 
		if(int_vx <= 3 and int_vx >= -3) sprite_index = walk2
		else sprite_index = runFast
	}
    else {
		sprite_index =   stand2
	}
} 

// Funcionalidad de X
if (intColLeft and keyLeft) or (intColRight and keyRight) { 
	//canDash = false
	isPlaning = false
	isDashing = false
	int_vx = 0
}

// Salto en la pared
if(!bol_surface){
	
	if(intColLeftJump and keyJump and !bolGround and !intColLeftNo){
		canDash = true
		dashDuration = maxDash
		int_vx = 8
		int_vxMax = 7
		int_vy = -intJumpHeight * 1
		
		jump = true
	}
	
	if(intColRightJump and keyJump and !bolGround and !intColRightNo){
		canDash = true
		dashDuration = maxDash
		int_vx = -8
		int_vxMax = 7
		int_vy = -intJumpHeight * 1
		
		jump = true
	}
}

if( y >= room_height + 150){
	die = true
}

with(plane){
	x = other.x - (0 * other.image_xscale/2 )
	y = other.y - 33
	if(other.int_move != 0){
		image_xscale = 2 * other.int_move
	}
}

if(bol_surface){
	canDash = false
	dashDuration = maxDash
	isDashing = false
}

if(!bolGround and keyA and !isDashing and stamina >= maxStamina/3 and !bol_surface){
	isPlaning = true
}

if (isPlaning) {
	
	if(stamina > 0 ){
		stamina--
	}
	
	if (play = 10) {
		audio_play_sound(snd_wind, 1, false)
		particula = part_system_create(psFly)
		part_system_position(particula, x, y - 22)
	}
	if(int_vy >= 0){
		// esta rotisimo
		int_vyMax = lerp(int_vyMax, 2, 0.25)
	}
	
	plane.visible = true
	play--
	
	if(isDashing or keyboard_check_released(ord("C")) or gamepad_button_check_released(0, gp_shoulderr) or stamina == 0 or bol_surface){
		isPlaning = false
	}
	
} else {
	plane.visible = false
	int_vyMax = lerp(int_vyMax, 6, 0.25)
	isPlaning = false
	play = 10
	if(stamina < maxStamina){
		stamina += 1
	}
	
}

if(instance_exists(ObjControl)){
	if(basuraRecolectada >= 20 and !showMessage){
		ObjControl.mensaje_ayuda = mensaje
		ObjControl.mensajeTime = 150
		showMessage = true
	}
}

if(die){
	x = xcheck
	y = ycheck
	
	int_vx = 0
	int_vy = 0
	flashAlpha = 1
	die = false
}

if(flashAlpha > 0){
	
	flashAlpha -=0.05
	if(flashAlpha == 0){
		talking = false
	}
}


if(place_meeting(x,y, obj_enemy)){ 
	die = true
}





