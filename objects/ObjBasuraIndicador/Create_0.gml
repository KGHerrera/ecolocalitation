// cantidad de intentos
cantidad_intentos = 10

// sprites que se usarán
sprites = ds_map_create();
ds_map_add(sprites, 0, sLata8);
ds_map_add(sprites, 1, sPapel8);
ds_map_add(sprites, 2, spPlatano8);


// Nos permite cambiar el sprite del objeto
function cambiar_sprite()
{
	var valor = noone;
	var sprite = noone;

	randomize();
	valor = round(real(random_range(0, 2)));
	sprite = ds_map_find_value(sprites, valor);

    sprite_index = sprite;
	ObjCaida.sprite_index = sprite;
}

// asignamos el sprite por primera vez
cambiar_sprite();