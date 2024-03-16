/// @description 

if(showing_dialog == false) {
	if(dialog.count() <= 0) {
		if(instance_exists(obj_player)){
			obj_player.talking = false
		}
		
		instance_destroy();
		return;
	}
	current_dialog = dialog.pop();
	showing_dialog = true;
} else {
	
	if(instance_exists(obj_player)){
		obj_player.talking = true
	}
	if(keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0, gp_face3)) {
		showing_dialog = false;
		alpha = 0;
	}
}