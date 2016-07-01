import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    id: item1
    FlatSearchInput {
        id: flatSearchInput1
        y: 44
        width: 500
        height: 50
        color: "#eaf0f5"
        radius: 2
        inactiveColor: "#4d5e72"
        defaultColor: "#f1f1f1"
        activeColor: "#000000"
        border.color: "#63717d"
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    TextArea {
        id: textArea1
        y: 111
        width: 680
        height: 200
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    FlatDefaultButton {
        id: flatDefaultButton1
        y: 47
        width: 180
        radius: 0
        text: "Agregar"
        anchors.left: flatSearchInput1.right
        anchors.leftMargin: 11
    }

    FlatSuccessButton {
        id: flatSuccessButton1
        x: 474
        text: "Guardar"
        anchors.top: textArea1.bottom
        anchors.topMargin: 10
    }

}
