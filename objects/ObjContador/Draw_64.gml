var x_init = 30; // posición inicial en X
var y_init = 20; // posición inicial en Y

var x_init2 = 84; // posición inicial en X
var y_init2 = 23; // posición inicial en Y

draw_sprite_ext(spBarTag72, 0, x_init, y_init - 2, 4, 4, 0, c_white, 1);
x_init += 54
y_init += 3

repeat(10) {
	draw_sprite_ext(spBar, 0, x_init2, y_init2, 4, 4, 0, c_grey, 1);
	x_init2 += 28; // incremento de la posición en X para el siguiente corazón
}

global.draw_set_font(Pixel)
draw_set_color(c_white);
draw_text(85, 58, "P: " + string(puntaje));

draw_set_color(c_white);


draw_text(215, 58, "Rep: " + string(ObjBasuraIndicador.cantidad_intentos));
global.draw_set_font(Pixel2)