var component;
var sprite;
var x = 500;
var y = 50;
function Mensaje(texto) {
    component = Qt.createComponent("../componentesLaterales/Mensaje.qml");
     sprite = component.createObject(chat, {"x": x, "y": y,"texto":texto});
    //sprite = component.createObject(chat, {"x": 100, "y": 100,});
    console.log("texto desde la funcion "+texto);
    y+=200;


        if (sprite == null) {
            // Error Handling
            console.log("Error creating object");
        }

}


