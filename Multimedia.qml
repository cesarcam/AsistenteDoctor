import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
Item {
    id: multimedia
    anchors.fill: parent
    Grid {
        id: grid1
        x: 310
        width: 550
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 0

        Flickable {
            id: flickable1
            clip: true
            flickableDirection: Flickable.AutoFlickDirection
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            contentWidth: imagenPrincipal.width; contentHeight: imagenPrincipal.height
            Image {
                id: imagenPrincipal
                source: "qrc:/img/img/multimedia.jpg"
            }
        }

        Image {
            id: image1
            width: 50
            height: 50
            anchors.horizontalCenterOffset: 50
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/src/chevron-right.png"
        }

        Image {
            id: image2
            width: 50
            height: 50
            anchors.horizontalCenterOffset: -50
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/src/chevron-left.png"
        }
    }

    Grid {
        id: grid2
        anchors.right: grid1.left
        anchors.rightMargin: 10
        spacing: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        FlatNumberNavButton {
            id: agregar2
            width: 82
            height: 47
            text: "Agregar"
            highlightColor: "#63c5da"
            checkedColor: "#59788e"
            pressColor: "#59788e"
            color: "#3498db"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
        }

        FlatNumberNavButton {
            id: eliminar
            width: 82
            height: 47
            text: "Eliminar"
            highlightColor: "#63c5da"
            checkedColor: "#59788e"
            pressColor: "#59788e"
            color: "#3498db"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: agregar2.right
            anchors.leftMargin: 10
        }

        FlatNumberNavButton {
            id: guardar
            width: 82
            height: 47
            text: "Guardar"
            highlightColor: "#63c5da"
            checkedColor: "#59788e"
            pressColor: "#59788e"
            color: "#3498db"
            anchors.left: eliminar.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
        }

        FlatInput {
            id: fechaIngreso
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: guardar.bottom
            anchors.topMargin: 10
            placeholderText: "Fecha de ingreso"

        }

        FlatInput {
            id: tituloFoto
            anchors.top: agregar2.bottom
            anchors.rightMargin: 10
            anchors.topMargin: 10
            placeholderText: "Titulo de la foto"
            anchors.leftMargin: 10
            anchors.left: parent.left
            anchors.right: parent.right
           validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
        }

        TextArea {
            id: textArea1
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: tituloFoto.bottom
            anchors.topMargin: 10
            text: "Ingresa una descripcion para la foto"
        }

        Image {
            id: image3
            x: 102
            width: 150
            height: 150
            anchors.horizontalCenterOffset: -100
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textArea1.bottom
            anchors.topMargin: 50
            source: "qrc:/img/img/perfil.png"
        }

        Image {
            id: image4
            x: 102
            width: 150
            height: 150
            anchors.top: textArea1.bottom
            source: "qrc:/img/img/perfil.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 50
            anchors.horizontalCenterOffset: 100
        }



        Dialog
        {
            id: dateDialog
            title: "Selecciona la fecha"
            standardButtons: StandardButton.Save | StandardButton.Cancel
            height: 200
            width: 280
            onAccepted:{
                fechaIngreso.text = calendar.selectedDate.toLocaleDateString()
            }
            Calendar {
                id: calendar
                x: 0
                y: 0
                onDoubleClicked: dateDialog.click(StandardButton.Save)
            }
        }



    }

}
