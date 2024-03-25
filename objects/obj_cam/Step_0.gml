
/*
var currentWidth = window_get_width()
var currentHeight = window_get_height() 


if(currentWidth != width || currentHeight != height){
	camera_set_view_size(view_camera[0], currentWidth/2, currentHeight/2)
	camera_apply(view_camera[0])
	
	display_set_gui_size(currentWidth, currentHeight)
	
	width = currentWidth
	height = currentHeight
}
*/

if(instance_exists(obj_control)){
	end_ = obj_control.end_
}

if(!freeze and instance_exists(following)){
	var view = view_camera[0];
	
	var cam_x = camera_get_view_x(view)
	var cam_y = camera_get_view_y(view)
	var fol_y = following.y - currentHeight/4/zoom
	var fol_x = following.x - currentWidth/4/zoom

	if(following.x > room_width - currentWidth/4/zoom) {
		new_x = lerp(cam_x, room_width - currentWidth/2/zoom, spd)
	}
	
	else if(following.x > currentWidth/4/zoom){
		new_x = lerp(cam_x, fol_x, spd)
	}
	
	else {
		new_x = lerp(cam_x, 0, spd)
	}
	
	
	new_y = lerp(cam_y, fol_y, spd)
	
	//layer
	layer_x(bg_1, new_x/3)
	layer_x(bg_2, new_x/2)
	layer_x(bg_3, new_x/1.5)
	layer_x(bg_4, new_x/1.2)
	layer_x(bg_5, new_x/8)
	
		
	if(shakeTimer > 0){
		new_x += random_range(-shakeMagnitud, shakeMagnitud)
		new_y += random_range(-shakeMagnitud, shakeMagnitud)
		shakeTimer--
	}

	//Check for Room Edge
	new_x = clamp(new_x, 0, room_width - currentWidth / 2 /zoom)
	new_y = clamp(new_y, 0, room_height - currentHeight / 2/zoom)

	camera_set_view_pos(view, new_x, new_y)
	camera_set_view_size(view, currentWidth/2/zoom, currentHeight/2/zoom);	

if(!end_){
	with(obj_player){
		
		if(obj_player.scaling){
			other.end_value = 0.75
			other.setZoom = true
		}
		
		else if (obj_player.int_vxMax > 6) {
			other.end_value = 0.9
			other.setZoom = true
		}
		
		else if(distance_to_object(obj_bote) < 100 
			or distance_to_object(obj_carrito) < 100){
			other.setZoom = true
			other.end_value = 0.9
		}
		
		else if(distance_to_object(obj_estrella_final) < 200){
			other.end_value = 0.8
			other.setZoom = true
		}
		
		
		else {
			other.end_value = 1.15
			other.setZoom = false
		} 
	}
} else{
	end_value = 0.6
	setZoom = true
	following = obj_estrella_final
}
	
	if(setZoom){
		zoom = lerp(zoom, end_value, increment);
	} else {
		zoom = lerp(zoom, start_value, decrement);
	}
}

if(keyboard_check_pressed(ord("F"))){ 
	freeze = !freeze
}
