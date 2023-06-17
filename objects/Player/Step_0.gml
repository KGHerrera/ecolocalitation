
// movimientos

if(!talking){
	keyRight  = keyboard_check(ord("L")) or gamepad_axis_value(0, gp_axislh) or keyboard_check(vk_right) or gamepad_button_check(0, gp_padr)
	keyLeft   = keyboard_check(ord("J")) or -gamepad_axis_value(0, gp_axislh) or keyboard_check(vk_left) or gamepad_button_check(0, gp_padl)
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

if(instance_exists(ObjControl)){
	if(!ObjControl.end_ and startTimer){
		timeElapsed += delta_time / 1000000;
	}
}

// velocidades dinamicas
if(intVXMax > intMaxGroundDash){
	intVXMax = lerp(intVXMax, intMaxGroundDash, 0.1);
}

if(isDashing and intVXMax < intMaxGroundDash){
	intVXMax = intMaxDashAcc
} else if(intVX < intVXReset and intVX > -intVXReset){
	intVXMax = intVXReset
} 


// Caida desde plataforma
if keyDown and place_meeting(x, y + 1, ObjPlataform) and !place_meeting(x, y + 1, ObjBlock) {
	y++
}

// comprobacion de coliciones
intColLeft		  = place_meeting(x - 1, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x - 1, y, "Collision"))
intColRight		  = place_meeting(x + 1, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x + 1, y, "Collision"))

intColLeftJump = place_meeting(x - 16, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x - 16, y, "Collision"))
intColRightJump = place_meeting(x + 16, y, ObjBlock) or (layer_exists("Collision") and scrTileMeeting(x + 16, y, "Collision"))

intColLeftNo	  = place_meeting(x - 1, y, ObjNoClimb) 
intColRightNo	  = place_meeting(x + 1, y, ObjNoClimb)

bolGround		  =	scrBolGround()
intMove			  = keyRight - keyLeft;

insMovilH		  = instance_place(x, y + 1, ObjMovilH)

bolSurface = place_meeting(x, y, ObjWater)

if(!bolSurface){

// Aceleracion y friccion
	if(!bolGround) {
		intTempAcc		= intAirAcc
		intTempFric		= intAirFric
	
	} else {
		intTempAcc		= intGroundAcc
		intTempFric		= intGroundFric
	
		if(isDashing and intVXMax < intMaxGroundDash) { 
			intVXMax = intMaxGroundDash
		}
	
		isDashing = false
		isPlaning = false

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
if(keyX and !bolGround and canDash){
	isDashing = true
}


if (isDashing) {
	
	canDash = false
	
	if(dashDuration == maxDash - 1){
		audio_play_sound(snd_dash, 12, false, 1, .3, .8)
	}
	
    dashDuration	-=  1
	
	
	// trail effect
	/*
	if(dashDuration % 6 == 0){
		with(instance_create_layer(x, y, "Instances", ObjTrail)) {
			sprite_index = other.sprite_index
			image_blend = c_white
			image_alpha = 0.7
			image_xscale = other.spriteSize * other.intMove
			image_yscale = other.spriteSize
		}
	}
	*/
	
	
	intVX = scrApproach(intVX, intVXMax * intMove, intTempAcc * 2)
	
	if(keyUp) {
		intVY = scrApproach(intVY, -intMaxDashAcc, intTempAcc * 4)
	}
	else if(keyDown) {
		intVY = scrApproach(intVY, intMaxDashAcc, intTempAcc * 4)
	}
	else {
		intVY = -intGravityNorm
	}
	
	if (dashDuration == 0 or keyboard_check_released(ord("X")) or gamepad_button_check_released(0, gp_face3)) {
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

if(!bolSurface){
	if (intMove != 0){
		intVX = scrApproach(intVX, intVXMax * intMove, intTempAcc)
	}
	else {
		intVX = scrApproach(intVX, intVXMax * intMove, intTempFric)
	}
} else {
	if (intMove != 0){
		intVX = scrApproach(intVX, intVXMaxW * intMove, intTempAcc)
	}
	else {
		intVX = scrApproach(intVX, intVXMaxW * intMove, intTempFric)
	}
}



// Velocidad sobre plataforma movil
if(instance_place(x, y + 1, ObjMovilH) and !instance_place(x, y, ObjMovilH) and !place_meeting(x + insMovilH.intVX, y, ObjBlock)){
	x += insMovilH.intVX
}

// Velocidad vertical // caida libre
if(!bolSurface) {
	if (!bolGround){
		if ((intColLeft or intColRight) and (intVY >= 0) and (keyLeft or keyRight)) {
			intVY = scrApproach(intVY, intVYMax/2, intGravitySlide)
		}
		else {
			intVY = scrApproach(intVY, intVYMax, intGravityNorm)
		}
	}

} else {
	
	if (!bolGround){
		
		intVY = scrApproach(intVY, intVYMaxW, intGravityWater)
		
	}
	
}


//salto
if(!bolSurface){
	if (bolGround and keyJump) {
		intVY = -intJumpHeight
	}
} else {
	
	if(keyJump and keyDown){
		intVY = intJumpHeightW - 2
		audio_play_sound(snd_splash, 0, false)
		
	}
	
	else if (keyJump) {
		intVY = -intJumpHeightW
		audio_play_sound(snd_splash, 0, false)
	}
	
}

// Salto pequeño
if (keyboard_check_released(ord("Z")) or gamepad_button_check_released(0, gp_face1)){
	if(intVY < 0 and !bolGround) {
		intVY *= 0.5
	}
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
 
// Animacion
// reflejo del personaje
if (intMove != 0) {
	image_xscale = intMove * spriteSize
}

if(!bolGround and bolSurface){
	
	sprite_index = swim2
	
} else if !bolGround {	
	if (isDashing and intVX == 0) {
		sprite_index = midair2
	}
	else if (isDashing) {
		sprite_index = dash2	
	} else if(isPlaning){
		sprite_index = take
	}
	else if (intColLeft and keyLeft and intVY > 0) {
		sprite_index = midair2
		image_xscale = spriteSize
	
	} else if (intColRight and keyRight and intVY > 0) {
		sprite_index = midair2
		image_xscale = -spriteSize
	} 	
	else {
		sprite_index = jumpFast
	}
}
// cambio de animacion
else {
	if(intVX != 0) { 
		if(intVX <= 3 and intVX >= -3) sprite_index = walk2
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
	intVX = 0
}

// Salto en la pared
if(!bolSurface){
	
	if(intColLeftJump and keyJump and !bolGround and !intColLeftNo){
		canDash = true
		dashDuration = maxDash
		intVX = intVXMax * 2
		intVXMax = intVXMax * 2
		intVY = -intJumpHeight * 1
	}
	
	if(intColRightJump and keyJump and !bolGround and !intColRightNo){
		canDash = true
		dashDuration = maxDash
		intVX = -intVXMax * 2
		intVXMax = intVXMax * 2
		intVY = -intJumpHeight * 1
	}
}

if( y >= room_height + 150){
	die = true
}

with(plane){
	x = other.x - (0 * other.image_xscale/2 )
	y = other.y - 33
	if(other.intMove != 0){
		image_xscale = 2 * other.intMove
	}
}

if(bolSurface){
	canDash = false
	dashDuration = maxDash
	isDashing = false
}

if(!bolGround and keyA and !isDashing and stamina >= maxStamina/2){
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
	if(intVY >= 0){
		intVYMax = lerp(intVYMax, 2, 0.25)
	}
	
	plane.visible = true
	play--
	
	if(isDashing or keyboard_check_released(ord("C")) or gamepad_button_check_released(0, gp_shoulderr) or stamina == 0){
		isPlaning = false
	}
	
} else {
	plane.visible = false
	intVYMax = lerp(intVYMax, 6, 0.25)
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
	flashAlpha = 1
	die = false
}

if(flashAlpha > 0){
	flashAlpha -=0.05
}






