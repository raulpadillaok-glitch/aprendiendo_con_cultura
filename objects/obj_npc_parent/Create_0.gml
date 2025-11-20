// Evento Create de obj_npc_parent

input_key = vk_space; // La tecla para interactuar
can_talk = false;     // Variable para saber si dibujar el icono

// Definimos dialog como -1 o array vacío por seguridad.
// Los hijos (como obj_npc_historia) o el código de creación de la room cambiarán esto.
dialog = -1;