// Evento Draw de obj_slider_volumen

// 1. Dibujar la barra y el botón (esto sigue igual)
draw_self();
var _knob_x = x + (sprite_width * volumen);
draw_sprite(spr_slider_knob, 0, _knob_x, y);


// --- AQUÍ PERSONALIZAMOS EL TEXTO ---

// 1. Elige la fuente que creaste
draw_set_font(fnt_opciones); 

// 2. Elige el color
// Puedes usar colores predefinidos como: c_white, c_yellow, c_red, c_lime, c_aqua, c_black...
draw_set_color(#FBAF5D); 

// 3. Configura la alineación (para que salga centrado sobre la barra)
draw_set_halign(fa_center);
draw_set_valign(fa_bottom); // Lo alineamos abajo para que el texto quede justo ENCIMA de la barra


// 4. Dibuja el texto (ahora saldrá amarillo y con tu fuente)
// (y - 5) es para que quede 5 píxeles arriba de la barra
draw_text(x + sprite_width/2, y - 5, "Volumen: " + string(round(volumen * 100)) + "%");


// --- IMPORTANTE: LIMPIEZA ---
// Siempre es bueno devolver los valores a la normalidad para no afectar a otros objetos
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white); // Devuélvelo a blanco por defecto
draw_set_font(-1);       // -1 significa "fuente por defecto"