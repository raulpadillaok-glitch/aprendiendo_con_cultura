// Evento Left Pressed de obj_button_fullscreen

// 1. Preguntamos: ¿Está ya en pantalla completa?
var _esta_full = window_get_fullscreen();

// 2. Le decimos: "Pon el estado OPUESTO al actual"
// El símbolo "!" significa NOT (no). 
// Si _esta_full es verdadero, !_esta_full es falso.
window_set_fullscreen(!_esta_full);