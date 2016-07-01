import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.0
Window {
    id: item1
   width: 720
   height: 420
    //anchors.fill: parent

    Rectangle{
        color: "#fff"
        anchors.fill: parent
    }

    FlatNumberNavButton {
        id: flatNumberNavButton1
        x: 474
        y: 443
        text: "Buscar"
        textColor: "#000000"
        textCheckedColor: "#000000"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    FlatInput {
        id: flatInput1
        y: 443
        text: "Buscar Estudio"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: flatNumberNavButton1.left
        anchors.rightMargin: 10
    }

    Text {
        id: text1
        text: qsTr("Lista General de Estudios")
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: flatNumberNavButton2.left
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.bold: true
        font.pixelSize: 30
    }

    FlatNumberNavButton {
        id: flatNumberNavButton2
        height: 47
        text: "Regresar"
        textColor: "#000000"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: traumasTabla.top
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 474
        anchors.right: parent.right
        anchors.rightMargin: 10
        MouseArea{
            anchors.fill: parent
            onClicked:{
                item1.visible = false
                loaderContenedorGeneral.source= "qrc:/vistas/ExpedienteClinico.qml"

            }
        }
    }


    TableView {
        id: traumasTabla
        x: 10
        anchors.top: text1.bottom
        anchors.topMargin: 15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10


        TableViewColumn {
            role: "tipo"
            title:"Tipo"
            width: 150
        }
        TableViewColumn {
            role: "seccion"
            title:"Seccion"
            width:150
        }
        TableViewColumn {
            role: "nombre"
            title:"Nombre"
            width:150
        }
        TableViewColumn {
            role: "marcar"
            title:"Marcar"
            width:150
        }
        model: padecimientoModel
    }

    Row {
        id: row1
        x: 0
        y: 0
        width: 700
        height: 600
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -103
        spacing: 0
        anchors.top: text1.bottom
        anchors.topMargin: 6
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

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

    }
}
