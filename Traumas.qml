import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import "../flatui"
Item{
    id: traumas
    ListModel {
        id: traumaModel
        ListElement {
            trauma: "Lession en pie izquierdo"
            fecha: "02/05/2016"
        }
        ListElement {
            trauma: "Lession dedo gordo"
            fecha: "02/01/2016"
        }
        ListElement {
            trauma: "Lession en pie izquierdo"
            fecha: "02/05/2016"
        }
        ListElement {
            trauma: "Lession dedo gordo"
            fecha: "02/01/2016"
        }
    }

    TableView {
        id: traumasTabla
        width: 750
        height: 400
        TableViewColumn {
            role: "trauma"
            title:"Trauma"
            width: 350
        }
        TableViewColumn {
            role: "fecha"
            title: "fecha"
            width:350
        }
        model: traumaModel

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
        width: 509
        height: 40
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: traumasTabla.bottom
        anchors.topMargin: 10

        FlatInput {
            id: descripcionTrauma1
            height: 35
            placeholderText: qsTr("ingresa el trauma")
            validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
        }
        FlatInput {
            id: fechaTrauma
            height: 35
            anchors.left: descripcionTrauma1.right
            anchors.leftMargin: 10
            placeholderText: "ingresa fecha del trauma"

            MouseArea{
                id: mouseArea1
                x: 0
                y: 0
                anchors.fill: fechaTrauma
                onClicked: {
                    dateDialog.visible = true
                }
            }
        }

        FlatSuccessButton {
            id: flatSuccessButton1
            height: 35
            radius: 2
            anchors.left: fechaTrauma.right
            anchors.leftMargin: 10
            text: "Guardar"
            highlightColor: "#63c5da"
            checkedColor: "#59788e"
            pressColor: "#59788e"
            color: "#3498db"

        }
    }
    Dialog
    {
        id: dateDialog
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            fechaTrauma.text = calendar.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: calendar
            x: 0
            y: 0
            onDoubleClicked: dateDialog.click(StandardButton.Save)
        }
    }
}
