puntaje = 0
sound = 1
timer_life = 20

intVX           =   0
intVY           =   0 
intMove			=   0

basuraRecolectada = 0

spriteSize = 2

// Aceleracion

intVYMax		=   6	
intVXMax		=	4	
intVXReset		=	4
intMaxGroundDash =  6

intJumpHeight   =   9
intGravityNorm	=   0.5
intGravitySlide =   0.5
intGroundAcc	=   1
intGroundFric	=   0.2
intAirAcc		=   1
intAirFric		=   .2

intMaxDashAcc	=	5

// bajo el agua
intVYMaxW		=   2
intVXMaxW		=	4
intJumpHeightW  =   6
intGravityWater	=   .25
intGroundAccW	=   .7
intGroundFricW	=   .3
intWaterAcc		=   .7
intWaterFric	=   .3


// Alarmas
maxDash			= 15
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
isPlaning = false

talking = false

plane = instance_create_layer(x, y, "Instances", ObjPlane)
play = 10

with(plane){
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

stamina = 65
maxStamina = stamina

flashAlpha = 0

