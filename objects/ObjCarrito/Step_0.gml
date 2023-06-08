/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (distance_to_object(Player) < 70 and Player.bolGround and Player.intVX == 0) {
	
		inst.visible = true;
		
		if(Player.keyX and !Player.talking){
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