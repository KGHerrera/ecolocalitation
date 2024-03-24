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
scrMagicBar(display_get_gui_width() / 2, 100, 100, 100, c_black, 35, 1, 20, _alpha)


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

scrMagicBar(display_get_gui_width() / 2, 100, obj_player.stamina, obj_player.maxStamina, colorBar, 30, 1, 10, _alpha)

draw_set_color(c_white) 

// relog
// Guardar el alineado actual
var currentAlign = draw_get_halign();

// Establecer el alineado horizontal al centro
draw_set_halign(fa_center);

// Dibujar el texto centrado horizontalmente y alineado al centro
//draw_text(100, 100, string(obj_player.int_vx))

draw_text(display_get_gui_width() / 2, 20 , string(obj_player.timeElapsed))

// Restaurar el alineado por defecto
draw_set_halign(currentAlign);

//draw_text(100,100, "LOSE: " + string(obj_player.int_vy))


var nearest_bote = noone;
var nearest_distance = 100000;  // A large starting distance

var nearest_bote = -1;
var nearest_distance = 100000;  // A large starting distance

// Find the nearest instance of obj_bote



if obj_player.papel > 0 {

// Determinar el tipo de residuo con el valor más grande
if (papeles > latas && papeles > organicas) {
    // Si el tipo de residuo más grande es "papeles", busca un bote de papel
    for (var i = 0; i < instance_number(obj_bote); ++i) {
        var bote_id = instance_find(obj_bote, i);
        if (bote_id.tipo == "papel") {
            var distance = point_distance(obj_player.x, obj_player.y, bote_id.x, bote_id.y);
            if (distance < nearest_distance) {
                nearest_distance = distance;
                nearest_bote = bote_id;
            }
        }
    }
} else if (latas > papeles && latas > organicas) {
    // Si el tipo de residuo más grande es "latas", busca un bote de latas
    for (var i = 0; i < instance_number(obj_bote); ++i) {
        var bote_id = instance_find(obj_bote, i);
        if (bote_id.tipo == "lata") {
            var distance = point_distance(obj_player.x, obj_player.y, bote_id.x, bote_id.y);
            if (distance < nearest_distance) {
                nearest_distance = distance;
                nearest_bote = bote_id;
            }
        }
    }
} else if (organicas > papeles && organicas > latas) {
    // Si el tipo de residuo más grande es "organicas", busca un bote de organicas
    for (var i = 0; i < instance_number(obj_bote); ++i) {
        var bote_id = instance_find(obj_bote, i);
        if (bote_id.tipo == "organ") {
            var distance = point_distance(obj_player.x, obj_player.y, bote_id.x, bote_id.y);
            if (distance < nearest_distance) {
                nearest_distance = distance;
                nearest_bote = bote_id;
            }
        }
    }
}


}

// If a nearest instance of obj_bote is found
if (nearest_bote != -1)
{
    // Calculate the direction towards the nearest instance
    var dir_x = nearest_bote.x  - obj_player.x;
    var dir_y = nearest_bote.y + (obj_bote.sprite_height) + 5  - obj_player.y;

    // Calculate the angle in radians
    var arrow_angle = point_direction(0, 0, dir_x, dir_y); // Multiply by -1 because GameMaker measures angles clockwise

    // Draw the arrow sprite rotated towards the nearest instance
    draw_sprite_ext(spr_arrow, 0, display_get_gui_width() / 2, 100, 2.2, 2.2, arrow_angle, c_white, 1);
}

