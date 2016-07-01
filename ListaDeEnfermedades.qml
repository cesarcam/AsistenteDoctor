import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.0
Window {
    id: item1
   width: 720
   height: 420
    Rectangle{
        color: "#fff"
        anchors.fill: parent
    }

    Text {
        id: text1
        width: 344
        height: 36
        text: qsTr("Lista de enfermedades")
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 30
    }

    FlatSearchInput {
        id: flatSearchInput1
        height: 35
        radius: 2
        selectedTextColor: "#cccccc"
        defaultColor: "#ffffff"
        activeColor: "#1abc9c"
        anchors.top: text1.bottom
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }
    ListModel {
        id: traumaModel
        ListElement {
            codigo: "12"
            subcodigo: "A"
            nombre: "Gripe"
        }
        ListElement {
            codigo: "13"
            subcodigo: "B"
            nombre: "N1H1"
        }
        ListElement {
            codigo: "15"
            subcodigo: "C"
            nombre: "Rubeola"
        }
    }

    FlatDefaultButton {
        id: flatDefaultButton1
        x: 418
        y: 674
        height: 35
        radius: 2
        text: "Guardar"
        anchors.right: parent.right
        anchors.rightMargin: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
    }

    TableView {
        id: traumasTabla
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: flatDefaultButton1.top
        anchors.bottomMargin: 10
        anchors.top: flatSearchInput1.bottom
        anchors.topMargin: 10
        TableViewColumn {
            role: "codigo"
            title:"codigo"
            width: 100
        }
        TableViewColumn {
            role: "subcodigo"
            title:"sub codigo"
            width: 100
        }
        TableViewColumn {
            role: "nombre"
            title: "Nombre"
            width: 350
        }
        model: traumaModel
    }



}
