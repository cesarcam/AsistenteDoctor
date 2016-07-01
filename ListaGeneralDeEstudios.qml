import "../flatui"
import QtQuick.Controls.Styles 1.4
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
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
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
        validator: RegExpValidator{regExp: /^[a-zA-Z]{3,30}$/}
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
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
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


        style: TableViewStyle {
            headerDelegate: Rectangle {
                height: 70
                width: 200
                color: "#3693d2"
                Text {
                    id: textItem
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: styleData.textAlignment
                    anchors.leftMargin: 50
                    text: styleData.value
                    elide: Text.ElideRight
                    color: "white"
                    renderType: Text.NativeRendering
                }
    }
        }
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
