// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scrSineMoveX(distance, speed_, time){
	var amplitude = distance / 2;
	var period = distance / speed_;

// Calcular la posición horizontal actual en función del tiempo
	return amplitude * sin(2 * pi * time / period);
}