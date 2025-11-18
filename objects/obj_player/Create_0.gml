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

level = 0;
xp = 0;
xp_requiere = 100;

function add_xp(_xp_to_add)
{
	xp += _xp_to_add;
	if(xp >= xp_requiere)
	{
		level++;
		xp -= xp_requiere;
		xp_requiere *= 1.4;
		
		hp_total += 5;
		hp=hp_total;
		damage +=0.8;
	create_dialog([
    {
        name: "Estadisticas",
        msg: $"Subiste de nivel! tus nuevas estadisticas son:\nNivel:{level}\nHP:{hp_total}\nDMG:{damage}"
    }
    ])	
	}
}
