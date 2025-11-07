// Evento Step de obj_player

// 1. OBTENER INPUT
var _key_up = keyboard_check(ord("W"));
var _key_down = keyboard_check(ord("S"));
var _key_left = keyboard_check(ord("A"));
var _key_right = keyboard_check(ord("D"));

var _move_x = _key_right - _key_left;
var _move_y = _key_down - _key_up;

// 2. CALCULAR MOVIMIENTO NORMALIZADO
var _final_move_x = 0;
var _final_move_y = 0;

if (_move_x != 0 || _move_y != 0) {
    var _dir = point_direction(0, 0, _move_x, _move_y);
    _final_move_x = lengthdir_x(velocidad, _dir);
    _final_move_y = lengthdir_y(velocidad, _dir);
}

// --- 3. COLISIÓN HORIZONTAL (Eje X) ---
// ### CORRECCIÓN: Ahora revisa el borde correcto (izq o der) ###

if (_final_move_x != 0) {
    var _sign_x = sign(_final_move_x);
    // Define el borde que se está moviendo (bbox_right es 1px más allá)
    var _edge_x = (_sign_x > 0) ? (bbox_right - 1) : bbox_left;

    // Revisa los dos puntos del borde (arriba y abajo)
    if (tilemap_get_at_pixel(tilemap_col, _edge_x + _final_move_x, bbox_top) || 
        tilemap_get_at_pixel(tilemap_col, _edge_x + _final_move_x, bbox_bottom - 1)) {
        
        // Si va a chocar, muévete 1 píxel a la vez
        while (!tilemap_get_at_pixel(tilemap_col, _edge_x + _sign_x, bbox_top) && 
               !tilemap_get_at_pixel(tilemap_col, _edge_x + _sign_x, bbox_bottom - 1)) {
            
            x = x + _sign_x;
            _edge_x = (_sign_x > 0) ? (bbox_right - 1) : bbox_left; // Actualiza el borde
        }
        _final_move_x = 0; // Detén el movimiento horizontal
    }
}
// Aplica el movimiento horizontal
x = x + _final_move_x;


// --- 4. COLISIÓN VERTICAL (Eje Y) ---
// ### CORRECCIÓN: Ahora revisa el borde correcto (arriba o abajo) ###
// ### SOLUCIÓN: "Indentamos" la revisión para evitar "engancharse" ###

if (_final_move_y != 0) {
    var _sign_y = sign(_final_move_y);
    var _edge_y = (_sign_y > 0) ? (bbox_bottom - 1) : bbox_top;

    // ### SOLUCIÓN AQUÍ! ###
    // Indentamos 1 píxel por cada lado para no detectar las paredes
    // por las que nos estamos deslizando.
    var _check_x1 = bbox_left + 1;
    var _check_x2 = bbox_right - 2; // (bbox_right - 1 es el borde, -2 es 1px adentro)

    // Revisa los dos puntos del borde (izq y der, pero indentados)
    if (tilemap_get_at_pixel(tilemap_col, _check_x1, _edge_y + _final_move_y) || 
        tilemap_get_at_pixel(tilemap_col, _check_x2, _edge_y + _final_move_y)) {

        // Si va a chocar, muévete 1 píxel a la vez
        while (!tilemap_get_at_pixel(tilemap_col, _check_x1, _edge_y + _sign_y) && 
               !tilemap_get_at_pixel(tilemap_col, _check_x2, _edge_y + _sign_y)) {
            
            y = y + _sign_y;
            _edge_y = (_sign_y > 0) ? (bbox_bottom - 1) : bbox_top; // Actualiza el borde
        }
        _final_move_y = 0; // Detén el movimiento vertical
    }
}
// Aplica el movimiento vertical
y = y + _final_move_y;


// --- 5. ANIMACIÓN DE SPRITES ---
// (Tu código de animación está perfecto, lo dejo igual)
if(_move_x !=0 or _move_y != 0){
    if(_move_y >0 ) sprite_index = spr_player_walk_down;
    else if(_move_y <0 ) sprite_index = spr_player_walk_up;
    else if(_move_x >0 ) sprite_index = spr_player_walk_right;
    else if(_move_x <0 ) sprite_index = spr_player_walk_left;
}
else 
{// mientres este parado en una horientacion 
    if(sprite_index == spr_player_walk_right) sprite_index =spr_player_idle_right
    else if(sprite_index == spr_player_walk_left) sprite_index =spr_player_idle_left
    else if(sprite_index == spr_player_walk_up) sprite_index =spr_player_idle_up
    else if(sprite_index == spr_player_walk_down) sprite_index =spr_player_idle_down
}

if(keyboard_check_pressed(vk_space))
{
	var _inst = instance_create_depth(x,y,depth,obj_attack);
	_inst.image_angle = point_direction(0,0,_move_x,_move_y);
	_inst.damage*=damage;
}