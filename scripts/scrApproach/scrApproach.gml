// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrApproach(argumento0, argumento1, argumento2){
	if(argumento0 < argumento1){
		return min(argumento0 + argumento2, argumento1)
	} else{
		return max(argumento0 - argumento2, argumento1)
	}
}