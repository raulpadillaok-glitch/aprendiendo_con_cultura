// Evento Create de obj_player

move_speed = 1;

// Obtiene el ID del Tilemap de la capa llamada "tiles_col"
// Asegúrate de que tu capa en el editor de rooms se llama exactamente "tiles_col"
tilemap = layer_tilemap_get_id("Tiles_Col");

// (Opcional) Un aviso si no encuentra la capa
if (tilemap == -1) {
    show_debug_message("¡ERROR! No se encontró la capa de colisión 'tiles_col'.");
}

hp = 10;
hp_total = hp;
damage = 1;
