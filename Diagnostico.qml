import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    id: item1
    TextArea {
        id: textArea1
        width: 680
        height: 300
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 30
    }

    FlatSuccessButton {
        id: flatSuccessButton1
        x: 474
        y: 425
        text: "Guardar"
        anchors.top: textArea1.bottom
        anchors.topMargin:10
    }

    Text {
        id: text1
        x: 10
        y: 9
        text: qsTr("Ingresa la descripcion del diagnostico")
        font.pixelSize: 12
    }

}
