if (array_length(messages) == 0) exit;
var _msg_data = messages[current_message]; // Datos del mensaje actual

// 1. Efecto Máquina de escribir (IGUAL QUE ANTES)
var _str = _msg_data.msg;
if (current_char < string_length(_str)) {
    current_char += char_speed;
    draw_message = string_copy(_str, 0, current_char);
    exit; // Si está escribiendo, no dejamos hacer nada más
}

// 2. LÓGICA DE PREGUNTA (NUEVO)
// Verificamos si el mensaje actual tiene la propiedad "is_question"
if (variable_struct_exists(_msg_data, "is_question") && _msg_data.is_question == true) 
{
    // Mover selector Arriba
    if (keyboard_check_pressed(input_up)) {
        menu_index--;
        if (menu_index < 0) menu_index = array_length(_msg_data.options) - 1;
    }
    
    // Mover selector Abajo
    if (keyboard_check_pressed(input_down)) {
        menu_index++;
        if (menu_index >= array_length(_msg_data.options)) menu_index = 0;
    }
    
    // Seleccionar respuesta (Enter o Espacio)
    if (keyboard_check_pressed(input_key)) {
        // Verificar si acertó
        if (menu_index == _msg_data.correct_index) {
            // ¡CORRECTO!
            // Puedes agregar un sonido de éxito aquí
            show_debug_message("¡Correcto!");
            
            // Pasar al siguiente mensaje o cerrar
            instance_destroy(); 
        } else {
            // INCORRECTO
            // Opción: Reiniciar el diálogo o poner un sonido de error
            show_debug_message("¡Incorrecto!");
        }
    }
}
// 3. LÓGICA NORMAL (Solo texto)
else 
{
    if (keyboard_check_pressed(input_key)) {
        current_message++;
        if (current_message >= array_length(messages)) {
            instance_destroy();
			
			if(next_room) room_goto(rm_game_1);
        } else {
            current_char = 0;
            draw_message = "";
        }
    }
}