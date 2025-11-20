// Evento Step de obj_npc_parent

// 1. Si YA hay un diálogo abierto, reseteamos can_talk y salimos.
// Esto evita que se abra el diálogo dos veces o se dibuje el icono encima del texto.
if (instance_exists(obj_dialog)) 
{
    can_talk = false;
    exit;
}

// 2. Comprobar distancia al jugador
// Asegúrate de que tu objeto jugador se llame 'obj_player'
if (distance_to_object(obj_player) < 16) 
{
    // Estamos cerca, mostramos el icono
    can_talk = true;

    // 3. Detectar la tecla
    if (keyboard_check_pressed(input_key))
    {
        // Verificamos que la variable 'dialog' tenga datos válidos
        if (dialog != -1) 
        {
            // Llamamos al script para crear el cuadro de texto
            create_dialog(dialog);
			
			if(final_npc) obj_dialog.next_room = true;
        }
    }
}
else
{
    // Estamos lejos, ocultamos el icono
    can_talk = false;
}