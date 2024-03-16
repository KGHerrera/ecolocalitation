timer2++;

if(timer2 > waitTime * room_speed){
	// Actualizar el temporizador
	timer++;

	// Comprobar si ha llegado el momento de parpadear
	if (timer >= blinkTime) {
	    blinking = true;
	}

	// Si aún no ha llegado el tiempo total, seguir desapareciendo
	if (timer < totalTime) {
	    // Aquí puedes agregar la lógica para mover o cambiar el objeto
	    mask_index = spInactive;
		if(!blinking) image_alpha = 1;
	} else {
	    // El tiempo total ha pasado, destruir el objeto o realizar alguna acción de finalización
	    // destroy
		blinking = false;
	    mask_index = sp_nothing;
		image_alpha = 0.2;

	    // Reiniciar el temporizador y el estado de parpadeo para volver a aparecer en 5 segundos
	    if (timer >= totalTime * 2) {
	        timer = 0;
	        blinking = false;
	        image_alpha = 1; // Asegúrate de que la imagen sea completamente visible al reiniciar
	    }
	}

	// Controlar el parpadeo
	if (blinking) {
	    var alphaValue = (timer div blinkSpeed) mod 2 == 0 ? 1 : 0; // Alterna entre 1 (visible) y 0 (invisible)
	    image_alpha = alphaValue;
	}
} else{
	mask_index = sp_nothing;
	image_alpha = 0;
}







