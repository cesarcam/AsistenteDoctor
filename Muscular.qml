import QtQuick 2.0
import QtQuick.Dialogs 1.2
Image {
    property var nombreMusculo
    id: muscular
    source: "qrc:/img/img/Sistema-Muscular-Humano.jpg"

    MouseArea {
        id: mouseArea1
        x: 278
        y: 266
        width: 100
        height: 100
        onClicked:{
            nombreMusculo = "Pectoral"
            ventana.open()
        }
    }




    Dialog{
       id:ventana
       title: "Musculo"
       standardButtons: StandardButton.Ok
       Text {
           id: nombre
           text: nombreMusculo
       }
    }

}
