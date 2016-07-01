import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
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
                role: "Nombre"
                title:"Nombre"
                width: 350
            }
            TableViewColumn {
                role: "Componentes"
                title: "Componentes"
                width:350
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


        ListModel {
            id: padecimientoModel
            ListElement {
                Nombre: "Cloratadina, paracetamol"
                Componentes: "sustrato de zinc, clorofelanina"
            }
            ListElement {
                Nombre: "Cloratadina, paracetamol"
                Componentes: "sustrato de zinc, clorofelanina"
            }
            ListElement {
                Nombre: "Cloratadina, paracetamol"
                Componentes: "sustrato de zinc, clorofelanina"
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
        validator: RegExpValidator{regExp: /^[a-zA-Z]{3,30}$/}
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
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"

    }



    Text {
        id: text1
        width: 329
        text: qsTr("Ingresa Medicamento")
        font.bold: true
        font.pointSize: 20
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

