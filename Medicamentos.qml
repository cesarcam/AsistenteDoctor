import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.0
Window {
    id: window1
    width: 720
    height: 420


    Rectangle{
        anchors.fill: parent
        color: "#FFF"
        anchors.rightMargin: 0
        anchors.bottomMargin: 30
        anchors.leftMargin: 0
        anchors.topMargin: -30
    }

    Row {
        id: row1
        anchors.top: text1.bottom
        anchors.topMargin: 10
        anchors.bottom: flatInput1.top
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10


        ////// TABLA DE MEDICAMENTOS INICIO /////
        TableView {
            id: traumasTabla
            anchors.topMargin: 50
            anchors.fill: parent
            TableViewColumn {
                role: "padecimiento"
                title:"Padecimiento"
                width: 350
            }
            TableViewColumn {
                role: "Medicamento"
                title: "Medicamento"
                width:350
            }
            model: padecimientoModel
        }


        ListModel {
            id: padecimientoModel
            ListElement {
                padecimiento: "gripe"
                Medicamento: "Cloratadina, paracetamol"
            }
            ListElement {
                padecimiento: "fiebre"
                Medicamento: "paracetamol"
            }
            ListElement {
                padecimiento: "cuerpo cortado"
                Medicamento: "medicamento"
            }
        }
        //////FIN TABLA INICIO ///////////////

    }

    FlatInput {
        id: flatInput1
        y: 630
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: flatNumberNavButton1.left
        anchors.rightMargin: 10
        placeholderText: "Ingresa el nombre del medicamento"
    }

    FlatNumberNavButton {
        id: flatNumberNavButton1
        x: 388
        y: 645
        text: "Aceptar"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        textColor: "#000000"
        defaultColor: "#d6dbdf"
    }



    Text {
        id: text1
        width: 329
        text: qsTr("Ingresa Medicamento")
        font.bold: true
        font.pointSize: 20
        anchors.right: flatNumberNavButton2.left
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: row1.top
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
    }

    // fin del contenedor de la tabla
}

