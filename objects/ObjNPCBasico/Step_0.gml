if(instance_exists(ObjControl)){
	end_ = ObjControl.end_
}

if (distance_to_object(obj_player) < 70 and obj_player.bolGround and !end_) {
	
		inst.visible = true;
		
		if(obj_player.keyX and !obj_player.talking){
			with(instance_create_depth(x,y, depth -1, ObjDialogo)){
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