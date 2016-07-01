import "../flatui"
import QtQuick.Controls 1.3
import QtQuick 2.0
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.0

Window{
    id: item
    width: 700
    height: 600
//    anchors.fill: parent

    Rectangle {
        id: rectangle1
        color: "#FFF"
        anchors.fill: parent
    }

    Flow {
        id: row1
        anchors.rightMargin: -2
        anchors.bottomMargin: 0
        anchors.leftMargin: 2
        anchors.topMargin: 0
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft

    }

    MessageDialog {
        id: messageDialog
        title: "Receta"
        text: "Eliminando Receta"
        visible: false
        onAccepted: {
            console.log("Debbugin de el mensaje.")
        }
    }

    FlatNumberNavButton {
        id: flatNumberNavButton1
        x: 476
        y: 240
        text: "Agregar a lista"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        textColor: "#000000"
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
    FlatNumberNavButton {
        id: flatNumberNavButton2
        x: 476
        width: 216
        height: 47
        text: "Finalizar"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: flatNumberNavButton1.left
        anchors.rightMargin: 10
        textColor: "#000000"

    }

    FlatDropdown {
        id: repeticion
        width: parent.width/5
        color: "#70a9e3"
        radius: 0
        text: "Repeticion"
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
        dropdownHeight: 100
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
        dropdownHeight: 100
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
    ListView {
        id: contenedor
        x: 50
        width: 100
        anchors.bottom: flatNumberNavButton2.top
        anchors.bottomMargin: 10
        anchors.top: presentacion.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        model: ListModel {
            id : lista
        }

        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row2
                spacing: 10
                Button{
                    Image {
                        id: eliminar
                        width :35
                        height:35
                        source:"qrc:/img/img/delete.png"
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.rightMargin: 10

                        Rectangle {
                            width: 40
                            height: 40
                            color: colorCode
                        }

                        Text {
                            text: name
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }

                    }
                }
            }
                ///Finaliza la lista///
                MouseArea{
                    id: mouseArea1
                    x: 285
                    y: 540
                    width: 89
                    height: 80
                    onClicked:
                    {
                        if(Validacion.validacion(textInput1.text) == true)
                        {
                            lista.append({"name": textInput1.text})
                            Validacion.addTask(source, textInput1.text);
                            textInput1.text = '';
                        }else
                        {
                            messageDialog.visible = true
                        }

                    }
                }
        }
    }

        FlatInput{
        id: textInput1
        text: qsTr("Ingrese El Medicamento")
        //inputMask: "Ingrese El Medicamento; "
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: flatDropdown2.top
        anchors.bottomMargin: 10
        anchors.top: text1.bottom
        anchors.topMargin: 8
        font.pixelSize: 25
        onFocusChanged:
        {
            textInput1.text = '';
        }

    }
}
