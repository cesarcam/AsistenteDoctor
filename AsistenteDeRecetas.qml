import "../flatui"
import QtQuick.Controls 1.3
import QtQuick 2.0
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.4
Window{
    id: item
    width: 700
    height: 600
//    anchors.fill: parent

    MessageDialog {
        id: messageDialog
        title: "Receta"
        text: "Eliminando Receta"
        visible: false
        onAccepted: {
            console.log("Debbugin de el mensaje.")
        }
    }

    FlatButton {
        id: flatNumberNavButton1
        x: 476
        y: 240
        height: 35
        text: "Agregar a lista"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
    FlatButton {
        id: flatNumberNavButton2
        x: 248
        y: 550
        width: 216
        height: 35
        text: "Finalizar"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: flatNumberNavButton1.left
        anchors.rightMargin: 10
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"


    }

    FlatDropdown {
        id: repeticion
        width: parent.width/5
        color: "#70a9e3"
        radius: 0
        text: "Repeticion"
        dropdownWidth: 100
        dropdownHeight: 150
        anchors.leftMargin: 6
        anchors.topMargin: 10
        anchors.top: textInput1.bottom
        anchors.left: medida.right
        model: ListModel{
            ListElement{item: "4 horas";}
            ListElement{item: "6 horas";}
            ListElement{item: "8 horas";}
            ListElement{item: "12 horas";}
            ListElement{item: "24 horas";}
        }
    }

    FlatDropdown {
        id: cantidad
        y: 110
        width: parent.width/5.5
        color: "#70a9e3"
        radius: 0
        text: "Cantidad"
        opacity: 0.8
        dropdownWidth: 100
        dropdownHeight: 150
        anchors.leftMargin: 20
        anchors.topMargin: 10
        anchors.top: textInput1.bottom
        anchors.left: presentacion.right
        model: ListModel{
            ListElement{item: "1";}
            ListElement{item: "2";}
        }
    }

    FlatDropdown {
        id: presentacion
        x: 0
        width: 103
        height: 40
        color: "#70a9e3"
        radius: 0
        text: "Presentacion"
        dropdownHeight: 150
        dropdownWidth: 100
        anchors.leftMargin: 16
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.top: textInput1.bottom
        model: ListModel{
            ListElement{item: "Mililitros";}
            ListElement{item: "Pastillas";}
            ListElement{item: "Intravenosa";}
            ListElement{item: "Unguento";}
        }
    }

    FlatDropdown {
        id: duracion
        width: 140
        color: "#70a9e3"
        radius: 0
        text: "Duracion"
        anchors.left: repeticion.right
        anchors.leftMargin: 10
        dropdownWidth: 100
        dropdownHeight: 150
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.top: textInput1.bottom
        anchors.right: parent.right
        model: ListModel{
            ListElement{item: "1 dia";}
            ListElement{item: "2 dias";}
            ListElement{item: "3 dias";}
            ListElement{item: "7 dias";}
            ListElement{item: "12 dias";}
        }
    }

    FlatDropdown {
        id: medida
        width: parent.width/5
        color: "#70a9e3"
        radius: 0
        text: "Medida"
        dropdownWidth: 100
        anchors.leftMargin: 8
        anchors.topMargin: 10
        anchors.top: textInput1.bottom
        anchors.left: cantidad.right
        model: ListModel{
            ListElement{item: "...";}
            ListElement{item: "...";}
            ListElement{item: "...";}
            ListElement{item: "...";}
            ListElement{item: "...";}
        }
    }


    Text {
        id: text1
        x: 230
        y: 13
        text: qsTr("Asistente de recetas")
        font.bold: true
        font.pixelSize: 25
    }
            ///Inicia la lista///
    Flow{
        width: parent.width
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottom:flatNumberNavButton1.top
        anchors.top: cantidad.bottom
        TableView {
            id: traumasTabla
            anchors.fill:parent
            TableViewColumn {
                role: "Presentacion"
                title:"Presentacion"
                width: 150
            }
            TableViewColumn {
                role: "Cantidad"
                title: "Cantidad"
                width:100
            }
            TableViewColumn {
                role: "Medida"
                title: "Medida"
                width:100
            }
            TableViewColumn {
                role: "Repeticion"
                title: "Repeticion"
                width:100
            }
            TableViewColumn {
                role: "Duracion"
                title: "Duracion"
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


        ListModel {
            id: padecimientoModel
            ListElement {
                Presentacion: "Mililitros"
                Cantidad: "1"
                Medida: "2 ml"
                Repeticion:"8 horas"
                Duracion:"5 dias"
            }
            ListElement {
                Presentacion: "Mililitros"
                Cantidad: "1"
                Medida: "2 ml"
                Repeticion:"8 horas"
                Duracion:"5 dias"
            }
            ListElement {
                Presentacion: "Mililitros"
                Cantidad: "1"
                Medida: "2 ml"
                Repeticion:"8 horas"
                Duracion:"5 dias"
            }
            ListElement {
                presentacion: "Mililitros"
                Cantidad: "1"
                Medida: "2 ml"
                Repeticion:"8 horas"
                Duracion:"5 dias"
            }

        }
    }

        FlatInput{
        id: textInput1
        placeholderText: "Ingrese el medicamento"
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.top: text1.bottom
        anchors.topMargin: 8
        font.pixelSize: 25
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}


    }
}
