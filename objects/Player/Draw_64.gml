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

global.draw_set_font(Pixel)
draw_set_color(c_white);
draw_text(85, 58, "P: " + string(Player.puntaje));

draw_set_color(c_white);


draw_text(215, 58, "Rec: " + string(Player.basuraRecolectada));
global.draw_set_font(Pixel2)


draw_set_color(c_white)


// cuando puedas agrega un reloj
//var x_pos = display_get_gui_width() - 200
//var y_pos =  20
//var seconds = Player.timeElapsed mod 60
//draw_text(x_pos, y_pos, string_format(seconds, 8, 3));



// x ,y ,value, max, colour, radius, transparency, width
scrMagicBar(display_get_gui_width() / 2, 50, 100, 100, c_black, 35, 1, 20)


// Stamina
var colorBar = make_color_rgb(74, 255, 61)

if(Player.canDash){
	colorBar = make_color_rgb(74, 255, 61)
} else{
	colorBar = make_color_rgb(20, 208, 255)
}

if(stamina <= maxStamina/2){
	colorBar = make_color_rgb(255, 13, 122)
}

scrMagicBar(display_get_gui_width() / 2, 50, Player.stamina, Player.maxStamina, colorBar, 30, 1, 10)

draw_set_color(c_white) 
//draw_text(20, 100, string(Player.papeles))



