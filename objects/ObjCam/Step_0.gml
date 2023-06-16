if(instance_exists(ObjControl)){
	end_ = ObjControl.end_
}

if(!freeze and instance_exists(following)){
	var view = view_camera[0];
	
	var cam_x = camera_get_view_x(view)
	var cam_y = camera_get_view_y(view)
	var fol_y = following.y - 320/1.8/zoom
	var fol_x = following.x - 640/2/zoom

	if(following.x > room_width - 640/2/zoom) {
		new_x = lerp(cam_x, room_width - 640/zoom, spd)
	}
	
	else if(following.x > 640/2/zoom){
		new_x = lerp(cam_x, fol_x, spd)
	}
	
	else {
		new_x = lerp(cam_x, 0, spd)
	}
	
	
	
	new_y = lerp(cam_y, fol_y, spd)
	
	
	if(shakeTimer > 0){
		new_x += random_range(-shakeMagnitud, shakeMagnitud)
		new_y += random_range(-shakeMagnitud, shakeMagnitud)
		shakeTimer--
	}
	
	//layer
	layer_x(backLayer, new_x/3)
	layer_x(backLayer2, new_x/2)
	layer_x(backLayer3, new_x/1.5)
	layer_x(backLayer4, new_x/8.5)
	
	layer_x(backLayerStatic, new_x/1.01)

	//Check for Room Edge
	new_x = clamp(new_x, 0, room_width - 640/zoom)
	new_y = clamp(new_y, 0, room_height - 320/zoom)

	camera_set_view_pos(view, new_x, new_y)
	camera_set_view_size(view, 640/zoom, 320/zoom);	

if(!end_){
	with(Player){
		
		if(other.following == ObjBote){
			zoom = 1.08
		} 
		
		else if(distance_to_object(ObjBote) < 100 
			or distance_to_object(ObjCarrito) < 100){
			other.setZoom = true
			other.end_value = 1.15
		}
		
		else if(distance_to_object(ObjEnd) < 200){
			other.end_value = 0.9
			other.setZoom = true
		}
		
		else if (Player.intVXMax > 6) {
			other.end_value = 0.8
			other.setZoom = true
		} else {
			other.end_value = 1.15
			other.setZoom = false
		} 
	}
} else{
	end_value = 0.8
	setZoom = true
	following = ObjEnd
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
