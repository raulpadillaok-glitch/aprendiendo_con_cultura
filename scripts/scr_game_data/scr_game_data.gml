// --- 1. COLORES Y VARIABLES GLOBALES ---
global.char_colors = {
    "Heroe": c_aqua,
    "Aldeano": c_white,
    "Profesor": c_yellow,
    "Guardia": c_ltgray,
	"Estadisticas": c_blue
};

// --- 2. HISTORIAS (Diálogos fijos) ---
global.historia_aldea = [
    { name: "Aldeano", msg: "Bienvenido a nuestra villa." },
    { name: "Aldeano", msg: "Ten cuidado, hay un examen de matematicas suelto por ahi." }
];

global.historia_castillo = [
    { name: "Guardia", msg: "Alto. Solo los sabios pueden pasar." },
    { name: "Heroe", msg: "Yo soy muy sabio" },
    { name: "Guardia", msg: "Ya veremos..." }
];

// --- 3. GENERADOR DE MATEMÁTICAS ---
function generar_pregunta_matematica() {
    var _a = irandom_range(0, 20);
    var _b = irandom_range(0, 20);
    var _resultado = _a + _b;
    
    // Respuestas falsas
    var _fake1 = _resultado + irandom_range(1, 4);
    var _fake2 = _resultado - irandom_range(1, 4);
    
    // Evitar duplicados
    if (_fake1 == _resultado) _fake1 += 1;
    if (_fake2 == _fake1 || _fake2 == _resultado) _fake2 -= 1;

    var _opciones = [];
    array_push(_opciones, string(_fake1));
    array_push(_opciones, string(_fake2));
    array_push(_opciones, string(_resultado));
    _opciones = array_shuffle(_opciones); // Barajar opciones
    
    var _indice_correcto = 0;
    for (var i = 0; i < array_length(_opciones); i++) {
        if (real(_opciones[i]) == _resultado) {
            _indice_correcto = i;
            break;
        }
    }

    return {
        name: "Profesor",
        msg: "Cuanto es " + string(_a) + " + " + string(_b) + "",
        is_question: true,
        options: _opciones,
        correct_index: _indice_correcto
    };
}