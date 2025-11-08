// Evento Create de obj_player

move_speed = 2;

tilemap = layer_tilemap_get_id("Tiles_Col");

 
if (tilemap == -1) {
    show_debug_message("¡ERROR! No se encontró la capa de colisión 'tiles_col'.");
}

hp = 10;
hp_total = hp;
damage = 1;

facing=0;

