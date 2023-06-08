/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
draw_self()

if(Player.flashAlpha > 0){
	shader_set(sp_flash)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, Player.flashAlpha)
	shader_reset()
}