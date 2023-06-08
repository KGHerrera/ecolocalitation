var i, k, spriteFrameCount=sprite_get_number(spr_transition), spriteWidth=sprite_get_width(spr_transition), spriteHeight=sprite_get_height(spr_transition);

if(transition){
	
	if(transitionSubImg < spriteFrameCount + window_get_width() / spriteWidth){
	    transitionSubImg += transitionSpeed;
	}else{
		transition = false;
	}
}

for(i=0; i<window_get_width() / spriteWidth; i++){
	for(k=0; k<window_get_height() / spriteHeight+1; k++){
		var spriteSubImg = transitionSubImg-i;
		if(spriteSubImg<0) spriteSubImg = 0;
		else if(spriteSubImg>spriteFrameCount-1) spriteSubImg = spriteFrameCount-1;
		draw_sprite(spr_transition, spriteSubImg, i*spriteWidth, k*spriteHeight);
	}
}