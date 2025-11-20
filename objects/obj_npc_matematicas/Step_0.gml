// Evento Step de obj_npc_matematicas

// 1. Revisa si el diálogo ya está abierto para no hacer nada
if (instance_exists(obj_dialog)) exit;

// 2. Comprobar distancia con el jugador
if (distance_to_object(obj_player) < 15) // 15 pixeles de distancia
{
    can_talk = true; // Esto hace que se dibuje el icono de hablar (spr_talk)
    
    // 3. Si presionamos ESPACIO
    if (keyboard_check_pressed(vk_space))
    {
        // --- AQUÍ ESTÁ EL CAMBIO ---
        // En lugar de leer una historia fija, generamos una nueva
        var _pregunta = generar_pregunta_matematica();
        
        // Creamos el diálogo pasándole la pregunta como un array
        create_dialog([_pregunta]);
    }
}
else
{
    // Si nos alejamos, apaga el icono
    can_talk = false;
}