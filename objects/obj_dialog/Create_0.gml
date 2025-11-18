messages = [];         // Se llenará desde create_dialog
current_message = 0; // Se establecerá desde create_dialog
current_char = 0;
draw_message = "";     // ¡IMPORTANTE! Inicializarlo vacío
char_speed = 1;        // Velocidad de la "máquina de escribir"
input_key = vk_space;  // Tecla para avanzar
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
