puntaje = 0
sound = 1

lose_jump = 0
max_jump_time = 10
bol_surface = false

int_vx           =   0
int_vy           =   0 
int_move			=   0

basuraRecolectada = 0

spriteSize = 2

// Aceleracion

int_vyMax		=   6	
int_vxMax		=	4	
int_vxReset		=	4
intMaxDashAcc	=	5
intMaxGroundDash =  6

intJumpHeight   =   9
intGravityNorm	=   0.5
intGravitySlide =   0.5
intGroundAcc	=   1
intGroundFric	=   0.2
intAirAcc		=   1
intAirFric		=   .2

// bajo el agua
int_vyMaxW		=   2
int_vxMaxW		=	4
intJumpHeightW  =   6
intGravityWater	=   .25
intGroundAccW	=   .7
intGroundFricW	=   .3
intWaterAcc		=   .7
intWaterFric	=   .3


// Alarmas
maxDash			= 12
dashDuration	= maxDash
canDash			= true
maxRegeneration = 100
regeneration	= maxRegeneration 
enemyColition   = false

contAcc = 0


vidas = 1
lifeIndex = 0
isDashing = false

papel = 0
papeles = 0
latas = 0
organicas = 0

isPlaning = false

talking = false
dieTime = 20

layer_collision = false

plane = instance_create_layer(x, y, layer, obj_plane)
play = 10

with(plane){
	depth = depth - 1
	visible = false
	image_xscale = 2
	image_yscale = 2
}

xcheck = x
ycheck = y

die = false

timeElapsed = 0
startTimer = false

showMessage = false
mensaje = "Bien hecho estas ayudando mucho!!"

stamina = 100
maxStamina = stamina

flashAlpha = 0


coldown_left = 0
coldown_right = 0

jump = false

scaling = false

barrel = false
barrel_coldown = 10

no_sprite = false

reload_sound = 10

time_die = 50
xDie = x
yDie = y



// controles del jugador
if (os_type == os_android) {
	with(instance_create_depth(0, 0, -10, obj_left)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_up)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_right)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_down)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_x)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_c)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_z)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_cambiar)){
		image_alpha = 0.3
	}
	with(instance_create_depth(0, 0, -10, obj_cambiar)){
		image_alpha = 0
	}
	with(instance_create_depth(0, 0, -10, obj_restart)){
		image_alpha = 0
	}

}

instance_create_depth(0, 0, -10, obj_pause);
