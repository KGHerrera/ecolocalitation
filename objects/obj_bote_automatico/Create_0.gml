burst = false
see = 0
select = instance_create_depth(x,y,1 , obj_select)

with (select){
	image_alpha = other.see
}

time = 0

angle = 0

wait_shot = 30
wait = wait_shot
image_angle_start = image_angle

