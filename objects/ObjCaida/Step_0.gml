if puede_caer{
	y+=avanzar;
}


collision_bote_amarillo = instance_place(x, y, ObjBoteAmarillo);
collision_bote_rojo = instance_place(x, y, ObjBoteRojo);
collision_bote_verde = instance_place(x, y, ObjBoteVerde);


if(collision_bote_amarillo or collision_bote_rojo or collision_bote_verde){

	if(collision_bote_amarillo){

		if(sprite_index == sPapel8){
			es_punto = true;
		}

	}else if(collision_bote_rojo){
	
	    if(sprite_index == sLata8){
			es_punto = true;
		}
	
	}else{
		
		if(sprite_index == spPlatano8){
			es_punto = true;
		}
		
	}
	
	var sprite = noone;
	
	if(es_punto){
		
		if(ObjContador.repeticiones==9){
			sprite = sp_10008;
		    ObjContador.puntaje += 1000;
			ObjContador.repeticiones = 0;
		}else{
			sprite = sp_208;
		    ObjContador.puntaje += 20;
			ObjContador.repeticiones += 1;
		}
		
		audio_play_sound(snd_bote, 10, false);
		
	}else{
	    sprite = sp_error8;
		ObjContador.repeticiones = 0;
		audio_play_sound(snd_error, 10, false);
	}
		
	with(instance_create_depth(x, y - 50, depth - 10, ObjText)){
		sprite_index = sprite;
		image_xscale*=1;
		image_yscale*=1;
	}
	
	y = 0;
	visible = false;
	es_punto = false;
	puede_caer = false;
	ObjBasuraIndicador.cambiar_sprite();
	
	ObjBasuraIndicador.cantidad_intentos-=1;
	
	if(ObjBasuraIndicador.cantidad_intentos==0){
		instance_create_depth(x, y, -1, ObjTransition);
	}
	
}
