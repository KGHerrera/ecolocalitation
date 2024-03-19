draw_self()

if(obj_player.flashAlpha > 0){
	shader_set(sh_flash)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, obj_player.flashAlpha)
	shader_reset()
}