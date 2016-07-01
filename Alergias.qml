import QtQuick 2.0
import QtQuick.Controls 1.3
import "../flatui"
Item{
    id:alergias
    anchors.fill: parent
    height: 800
    TextArea {
        id: textArea1
        y: 36
        width: 690
        height: 153
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    TextArea {
        id: textArea2
        x: -6
        y: 213
        width: 690
        height: 153
        anchors.leftMargin: 10
        anchors.left: parent.left
    }

    Text {
        id: medicamentos
        x: 15
        y: 17
        width: 86
        height: 13
        text: qsTr("Medicamentos")
        font.pixelSize: 12
    }

    Text {
        id: alimentos
        x: 15
        y: 195
        width: 86
        height: 13
        text: qsTr("Alimentos")
        font.pixelSize: 12
    }

    TextArea {
        id: textArea3
        x: 0
        y: 390
        width: 690
        height: 153
        anchors.leftMargin: 10
        anchors.left: parent.left
    }

    Text {
        id: medioAmbiente
        x: 15
        y: 372
        width: 86
        height: 13
        text: qsTr("Medio ambiente")
        font.pixelSize: 12
    }

    TextArea {
        id: textArea4
        x: 4
        y: 567
        width: 690
        height: 153
        anchors.leftMargin: 10
        anchors.left: parent.left
    }

    Text {
        id: otros
        x: 15
        y: 549
        width: 86
        height: 13
        text: qsTr("Otros")
        font.pixelSize: 12
    }

    FlatSuccessButton {
        id: flatSuccessButton1
        x: 424
        y: 737
        text: "Guardar"
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"

        padding: 93
    }

}
