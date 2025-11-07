// Evento Create de obj_player

velocidad = 1;

// Obtiene el ID del Tilemap de la capa llamada "tiles_col"
// Asegúrate de que tu capa en el editor de rooms se llama exactamente "tiles_col"
tilemap_col = layer_tilemap_get_id("tiles_col");

// (Opcional) Un aviso si no encuentra la capa
if (tilemap_col == -1) {
    show_debug_message("¡ERROR! No se encontró la capa de colisión 'tiles_col'.");
}