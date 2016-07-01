import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Item {
    id: seguroMedico
    anchors.fill: parent

    Grid {
        id: grid1
        width: parent.width/2
        height: 147
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10

        FlatInput {
            id: flatInput1
            height: 40
            placeholderText: "Institucion o aseguradora"
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

        FlatInput {
            id: flatInput2
            width: parent.width
            height: 40
            placeholderText: "Nombre del titular"
            anchors.top: flatInput1.bottom
            anchors.topMargin: 10
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
        }
    }

    Grid {
        id: grid2
        x: 9
        y: -7
        width: parent.width/2
        height: 147
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.leftMargin: 10
        anchors.left: grid1.right

        FlatInput {
            id: poliza
            width: parent.width
            height: 40
            placeholderText: "Numero de seguro o poliza"
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.topMargin: 20
            anchors.leftMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Row {
            id: row2
            anchors.top: poliza.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 10

            FlatInput {
                id: fechaExpedicion
                width: (parent.width/2)
                height: 40
                pointSize: 10
                placeholderText: "Fecha de expedicion"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                MouseArea{
                    id: expedicion
                    x: 0
                    y: 0
                    anchors.fill: fechaExpedicion
                    onClicked: {
                        dateDialogExpedicion.visible = true
                    }
                }
            }

            FlatInput {
                id: fechaExpiracion
                height: 40
                anchors.right: parent.right
                anchors.rightMargin: 0
                pointSize: 10
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 0
                placeholderText: "Fecha de expiracion"
                anchors.left: fechaExpedicion.right
                MouseArea{
                    id: expiracion
                    x: 0
                    y: 0
                    anchors.fill: fechaExpiracion
                    onClicked: {
                        dateDialogExpiracion.visible = true
                    }
                }
            }
        }
    }

    Row {
        id: row1
        height: 90
        anchors.top: grid1.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        FlatInput {
            id: familiar1
            width: (parent.width/2)
            height: 40
            placeholderText: "Nombre del familiar #1"
            anchors.leftMargin: 0
            anchors.left: parent.left
            pointSize: 10
        }

        FlatInput {
            id: telefonoFamiliar1
            height: 40
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.leftMargin: 10
            placeholderText: "Telefono"
            anchors.left: familiar1.right
            pointSize: 10
        }

        FlatInput {
            id: telefonoFamiliar2
            width: (parent.width/2)
            height: 40
            anchors.top: telefonoFamiliar1.bottom
            anchors.rightMargin: 10
            anchors.topMargin: 10
            placeholderText: "Telefono"
            anchors.leftMargin: 10
            anchors.left: familiar2.right
            pointSize: 10
            anchors.right: parent.right
        }

        FlatInput {
            id: familiar2
            width: (parent.width/2)
            height: 40
            anchors.right: telefonoFamiliar2.left
            anchors.rightMargin: 10
            anchors.top: familiar1.bottom
            anchors.topMargin: 10
            anchors.leftMargin: 10
            placeholderText: "Nombre del familiar #2"
            anchors.left: parent.left
            pointSize: 10
        }

    }

    TextArea {
        id: textArea1
        height: 131
        font.family: "Arial"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: row1.bottom
        anchors.topMargin: 18

    }

    FlatSuccessButton {
        id: flatSuccessButton1
        x: 414
        height: 35
        text: "Guardar"
        padding: 88
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: textArea1.bottom
        anchors.topMargin: 10
    }

    Label {
        id: textoSeguro
        x: 10
        y: 150
        text: qsTr("En caso de accidente notificar a las siguientes personas")
    }

    Label {
        id: textoSeguro1
        x: 8
        y: 271
        text: qsTr("Observaciones")
    }

    Dialog
    {
        id: dateDialogExpedicion
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            fechaExpedicion.text = calendar.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: calendar
            x: 0
            y: 0
            onDoubleClicked: dateDialogExpedicion.click(StandardButton.Save)
        }
    }
    Dialog
    {
        id: dateDialogExpiracion
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            fechaExpiracion.text = calendarExpiracion.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: calendarExpiracion
            x: 0
            y: 0
            onDoubleClicked: dateDialogExpiracion.click(StandardButton.Save)
        }
    }

}
