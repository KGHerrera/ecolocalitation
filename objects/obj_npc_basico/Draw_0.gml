draw_self()

with(intance_button){
	image_alpha = other.show_instance
}


if instance_exists(obj_player){
	
	if distance_to_object(obj_player) < 100 and obj_player.bolGround and obj_player.keyX {
		obj_player.talking = true
		talking = true
	} 
	
	show_instance = !obj_player.talking and distance_to_object(obj_player) < 100 and obj_player.bolGround
		
	if(talking) { 
		draw_set_font(Pixel2)
		
		var complete = msg_dynamic_multi(lista[text_index])
		if complete {
			msg_stop()
			
			line = 0
			char = 0
			obj_player.talking = false
			talking = false
			
		}
	} 
	
}
