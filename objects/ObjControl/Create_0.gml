/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
global.draw_set_font(Pixel)
display_set_gui_size(1366, 768)

currentHeight = display_get_height() 
targetHeight = display_get_height() 
targetX = -display_get_gui_width();
currentX = -display_get_gui_width()

inicio = true
animation_time = 130

end_ = false
wait = 250

mensaje_ayuda = "ya llevas 10 objetos"
mensajeTarget = -50
currentMensaje = -50
mensajeTime = 0