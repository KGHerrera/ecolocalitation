/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
var _camW 	= camera_get_view_width(camera);
var _camH 	= camera_get_view_height(camera);
var _camX 	= camera_get_view_x(camera) + _camW / 2;
var _camY 	= camera_get_view_y(camera) + _camH / 2;

var _viewMat = matrix_build_lookat(_camX - 20, _camY + 10, camDist, _camX, _camY, 0, 0, 1, 0);
var _projMat = matrix_build_projection_perspective_fov(camFov, camAsp, 3, 30000);

camera_set_view_mat(camera, _viewMat);
camera_set_proj_mat(camera, _projMat);

camera_apply(camera);