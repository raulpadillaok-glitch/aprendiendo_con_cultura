// Evento Draw de obj_npc_parent

// 1. Dibujar al propio NPC (si no pones esto, será invisible)
draw_self();

// 2. Dibujar el icono de "Hablar"
// Solo si can_talk es verdadero Y no hay un diálogo activo
if (can_talk && !instance_exists(obj_dialog))
{
    // Dibuja el spr_talk centrado arriba del NPC
    // Ajusta el "- 32" dependiendo de la altura de tu sprite para que no flote muy alto o muy bajo
    draw_sprite(spr_talk, 0, x, bbox_top - 20);
}