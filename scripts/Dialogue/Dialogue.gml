// Esta función está bien
function create_dialog(_messages){
    if(instance_exists(obj_dialog)) return;

    var _inst = instance_create_depth(0,0,0,obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

// Esta variable está bien
global.char_colors = {
	"Heroe": c_aqua,
	"Aldeano": c_white,
	"Rey": c_yellow,
	"Misterioso": c_purple,
	"Vendedor": c_lime,
	"Estadisticas": c_fuchsia,
	"Error": c_red
}

// ### ¡AQUÍ ESTÁ EL CAMBIO! ###
// Añade "global." para que la variable sea global
global.welcome_dialog = [
{
	name: "Aldeano", // <-- Usará c_white
	msg: "Hola, viajero... El Rey te espera en el castillo."
},
{
	name: "Heroe",   // <-- Usará c_aqua
	msg: "Gracias Ire de inmediato."
}
]

// Un diálogo para otro NPC
global.shop_dialog = [
{
	name: "Vendedor", // <-- Usará c_lime
	msg: "Tengo las mejores pociones a la venta"
}
]