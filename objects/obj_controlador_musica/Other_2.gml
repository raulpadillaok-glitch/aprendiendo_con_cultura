// Evento Room Start de obj_controlador_musica

// 'room' es una variable interna que sabe en qué room estamos

switch (room) 
{
    // --- CASO 1: Si estamos en el menú ---
    case rm_game:
        // Revisa si la música del menú NO está sonando ya
        if (musica_actual != snd_musica_menu) 
        {
            audio_stop_all(); // Detiene cualquier música anterior (la del juego, si volvemos)
            musica_actual = snd_musica_menu; // Actualiza la variable

            // (sonido, prioridad, loop)
            audio_play_sound(musica_actual, 10, true); 
        }
        break; // Termina el caso del menú

    // --- CASO 2: Si estamos en el juego ---
    case rm_menu:
        // Revisa si la música del juego NO está sonando ya
        if (musica_actual != snd_musica_juego) 
        {
            audio_stop_all(); // Detiene la música del menú
            musica_actual = snd_musica_juego; // Actualiza la variable

            // (sonido, prioridad, loop)
            audio_play_sound(musica_actual, 10, true);
        }
        break; // Termina el caso del juego

    // --- OTRO CASO: Si entramos a una room sin música (ej. Opciones) ---
    default:
        // Si entramos a CUALQUIER OTRA room que no sea menú o juego
        // audio_stop_all();
        // musica_actual = -1;
        break;
}