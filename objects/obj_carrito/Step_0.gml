/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (distance_to_object(obj_player) < 70 and obj_player.bolGround and obj_player.int_vx == 0) {
	
		inst.visible = true;
		
		if(obj_player.keyX and !obj_player.talking){
			with(instance_create_depth(x,y, depth -1, obj_dialogo)){
				for(i = 0; i < array_length(other.dialogList); i++){
					dialog.add(other.pfp, other.dialogList[i])
				}
			}
		}
	
}

else {
	with (inst) {
		visible = false;
	}
}