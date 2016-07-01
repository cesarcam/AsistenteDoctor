import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    id: item1
    height: 790
    TextArea {
        id: textArea1
        width: 680
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    TextArea {
        id: textArea2
        x: -5
        y: 2
        width: 680
        height: 154
        anchors.left: parent.left
        anchors.topMargin: 30
        anchors.leftMargin: 10
        anchors.top: textArea1.bottom
    }

    TextArea {
        id: textArea3
        x: -2
        y: -1
        width: 680
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 10
        anchors.top: textArea2.bottom
    }

    TextArea {
        id: textArea4
        x: -1
        y: -3
        width: 680
        anchors.left: parent.left
        anchors.topMargin: 22
        anchors.leftMargin: 10
        anchors.top: textArea3.bottom
    }

    FlatSuccessButton {
        id: guardarNota
        x: 474
        text: "Guardar"
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
        anchors.top: textArea4.bottom
        anchors.topMargin: 10
    }

    Text {
        id: text1
        x: 10
        y: 20
        text: qsTr("Criterio de diagnostico")
        font.pixelSize: 12
    }

    Text {
        id: text2
        x: 10
        y: 206
        text: qsTr("Plan de estudios")
        font.pixelSize: 12
    }

    Text {
        id: text3
        x: 12
        y: 383
        text: qsTr("Sugerencia de diagnostico")
        font.pixelSize: 12
    }

    Text {
        id: text4
        x: 12
        y: 554
        height: 16
        text: qsTr("Sugerencia de tratamiento")
        font.pixelSize: 12
    }

}
