// Archivo: scr_dialog_system

function create_dialog(_messages){
    // Si ya existe un dialogo, salir
    if(instance_exists(obj_dialog)) return;

    // Crear la instancia del dialogo
    var _inst = instance_create_depth(0, 0, -9999, obj_dialog); // -9999 para que se vea encima de todo
    _inst.messages = _messages;
    _inst.current_message = 0;
}