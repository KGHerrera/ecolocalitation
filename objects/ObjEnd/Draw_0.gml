draw_self()

if(flashAlpha > 0){
	shader_set(sp_flash)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, flashAlpha)
	shader_reset()
}
