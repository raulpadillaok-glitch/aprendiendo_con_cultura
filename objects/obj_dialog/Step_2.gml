// Si no hay mensajes, no hagas nada
if (array_length(messages) == 0) exit;

// Asegúrate de que el mensaje actual existe
if (current_message < 0 || current_message >= array_length(messages)) {
    instance_destroy();
    exit;
}

var _str = messages[current_message].msg;

if (current_char < string_length(_str))
{
    // Efecto "máquina de escribir"
    current_char += char_speed * (1 + real(keyboard_check(input_key)));
    draw_message = string_copy(_str, 0, current_char);
}
else if (keyboard_check_pressed(input_key))
{
    // Avanzar al siguiente mensaje
    current_message++;
    if (current_message >= array_length(messages))
    {
        // Se acabaron los mensajes
        instance_destroy();
    }
    else
    {
        // Preparar el siguiente mensaje
        current_char = 0;
        draw_message = ""; // Reiniciar el texto a dibujar
    }
}