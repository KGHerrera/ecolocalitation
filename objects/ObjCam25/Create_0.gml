/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
camera	= view_camera[0];

// 3D camera properties
camDist	= -200;
camFov	= 70;
camAsp	= camera_get_view_width(camera) / camera_get_view_height(camera);



backLayer = layer_get_id("bg_1")
backLayer2 = layer_get_id("bg_2")
backLayer3 = layer_get_id("bg_3")
backLayer4 = layer_get_id("bg_4")

freeze = false;


// cosas del zoom
zoom = 1
start_value = zoom
end_value = 1.15
increment = 0.01
decrement = 0.01
setZoom = false

shakeTimer = 0
shakeMagnitud = 2

spd = 0.08

end_ = false

if(instance_exists(Player)){
	following = Player
} else if instance_exists(ObjBoteVerde){
	following = ObjBoteVerde
}