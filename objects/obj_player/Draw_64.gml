var _alpha = 1

if obj_player.scaling {
	_alpha = 0.1
} else {
	_alpha = 1
}

var x_init = 30; // posición inicial en X
var y_init = 20; // posición inicial en Y

var color = c_white

var x_init2 = 84; // posición inicial en X
var y_init2 = 23; // posición inicial en Y

draw_sprite_ext(spBarTag72, 0, x_init, y_init - 2, 4, 4, 0, c_white, 1);
x_init += 54
y_init += 3

repeat(10) {
	draw_sprite_ext(spBar, 0, x_init2, y_init2, 4, 4, 0, c_grey, 1);
	x_init2 += 28; // incremento de la posición en X para el siguiente corazón
}

repeat(papel) {
	draw_sprite_ext(spBar, 0, x_init, y_init, 4, 4, 0, color, 1);
	x_init += 28; // incremento de la posición en X para el siguiente corazón
}

//global.draw_set_font(Pixel)
draw_set_color(c_white);
draw_text(85, 58, "P: " + string(obj_player.puntaje));

draw_set_color(c_white);




draw_text(215, 58, "R: " + string(obj_player.basuraRecolectada));
draw_set_font(Pixel2)


draw_set_color(c_white)



// x ,y ,value, max, colour, radius, transparency, width, alpha
scrMagicBar(display_get_gui_width() / 2, 50, 100, 100, c_black, 35, 1, 20, _alpha)


// Stamina
var colorBar = make_color_rgb(74, 255, 61)

if(obj_player.canDash){
	colorBar = make_color_rgb(74, 255, 61)
} else{
	colorBar = make_color_rgb(20, 208, 255)
}

if(stamina <= maxStamina/3){
	colorBar = make_color_rgb(255, 13, 122)
}

scrMagicBar(display_get_gui_width() / 2, 50, obj_player.stamina, obj_player.maxStamina, colorBar, 30, 1, 10, _alpha)

draw_set_color(c_white) 

// relog
// Guardar el alineado actual
var currentAlign = draw_get_halign();

// Establecer el alineado horizontal al centro
draw_set_halign(fa_center);

// Dibujar el texto centrado horizontalmente y alineado al centro
//draw_text(100, 100, string(obj_player.int_vx))

draw_text(display_get_gui_width() / 2, 90 , string(obj_player.timeElapsed))

// Restaurar el alineado por defecto
draw_set_halign(currentAlign);

//draw_text(100,100, "LOSE: " + string(obj_player.int_vy))




