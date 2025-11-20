var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

// Dibuja el fondo
draw_sprite_stretched(spr_box, 0, _dx, _dy, _boxw,  _boxh);

_dx += 16;
_dy += 16;

draw_set_font(Font1);
draw_set_valign(fa_top); // Asegura que el texto se dibuje desde arriba
draw_set_halign(fa_left);

// Si no hay mensajes, no dibujes texto
if (array_length(messages) == 0 || current_message < 0) exit;
if (current_message >= array_length(messages)) exit;


// --- DIBUJAR NOMBRE Y COLOR ---
var _name = messages[current_message].name;

// Revisa si el color existe en el struct
if (is_struct(global.char_colors) && variable_struct_exists(global.char_colors, _name))
{
    // ¡CORREGIDO! Sin espacio
    draw_set_color(global.char_colors[$ _name]);
}
else
{
    draw_set_color(c_white); // Un color por defecto si no lo encuentra
}

draw_text(_dx, _dy, _name);
draw_set_color(c_white);
_dy += 40;

// --- DIBUJAR MENSAJE ---
draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx * 2);
// --- DIBUJAR OPCIONES (NUEVO) ---
var _msg_data = messages[current_message];

// Solo dibujamos si el texto terminó de escribirse Y es una pregunta
if (current_char >= string_length(_msg_data.msg) && 
    variable_struct_exists(_msg_data, "is_question") && 
    _msg_data.is_question == true) 
{
    var _opt_x = _dx + 20;     // Un poco a la derecha
    var _opt_y = _dy + 60;     // Debajo del texto principal
    var _spacing = 30;         // Espacio entre opciones
    
    for (var i = 0; i < array_length(_msg_data.options); i++) {
        
        // Si es la opción seleccionada, cambiar color y poner una flecha ">"
        if (i == menu_index) {
            draw_set_color(c_yellow);
            draw_text(_opt_x - 15, _opt_y + (i * _spacing), ">");
        } else {
            draw_set_color(c_white);
        }
        
        // Dibujar la opción (el número)
        draw_text(_opt_x, _opt_y + (i * _spacing), _msg_data.options[i]);
    }
    
    // Restaurar color
    draw_set_color(c_white);
}