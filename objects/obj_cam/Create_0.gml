bg_1 = layer_get_id("bg_1")
bg_2 = layer_get_id("bg_2")
bg_3 = layer_get_id("bg_3")
bg_4 = layer_get_id("bg_4")
bg_5 = layer_get_id("bg_static")

freeze = false;


// cosas del zoom
zoom = 0.9
start_value = zoom
end_value = 1.15
increment = 0.01
decrement = 0.01
setZoom = false

shakeTimer = 0
shakeMagnitud = 2

spd = 0.08

end_ = false

if(instance_exists(obj_player)){
	following = obj_player
} else if instance_exists(obj_bote_verde){
	following = obj_bote_verde
}