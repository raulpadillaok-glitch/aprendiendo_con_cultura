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