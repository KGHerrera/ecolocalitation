/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();


if place_meeting(x + 5 * cambio_direccion, y, obj_block) or scrTileMeeting(x + 5 * cambio_direccion, y, "Collision")  {
	cambio_direccion *= -1
	image_xscale = cambio_direccion
}

if !place_meeting(x + 16* cambio_direccion, y + 1, obj_block) and bolGround{
	cambio_direccion *= -1
	image_xscale = cambio_direccion
}


int_vx = scrApproach(int_vx, 2 * cambio_direccion, velocidad)

