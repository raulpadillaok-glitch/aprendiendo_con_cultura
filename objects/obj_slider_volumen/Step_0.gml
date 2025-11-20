// Evento Step

// 1. DETECTAR CLIC
// Si presionamos el botón izquierdo SOBRE la barra...
if (mouse_check_button_pressed(mb_left)) {
    // collision_point revisa si el ratón toca este objeto
    if (collision_point(mouse_x, mouse_y, id, false, false)) {
        is_dragging = true;
    }
}

// 2. LOGICA DE ARRASTRE
if (is_dragging) {
    // Si soltamos el clic, dejamos de arrastrar
    if (mouse_check_button_released(mb_left)) {
        is_dragging = false;
    }
    
    // --- CÁLCULO MATEMÁTICO ---
    // Calculamos la posición relativa del ratón (mouse_x - x)
    // Y la dividimos por el ancho total de la barra (sprite_width)
    // Esto nos da un número entre 0.0 y 1.0
    volumen = (mouse_x - x) / sprite_width;
    
    // Nos aseguramos de que no pase de 1 ni baje de 0 (clamp)
    volumen = clamp(volumen, 0, 1);
    
    // 3. APLICAR EL VOLUMEN AL JUEGO
    // El '0' es el índice del "listener" (oyente principal)
    audio_set_master_gain(0, volumen);
}