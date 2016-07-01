import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.4

Item {
    id: item1
    anchors.fill: parent

    Row {
        id: row1
        width: 700
        height: 75
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        FlatInput {
            id: envia
            width: parent.width/3
            height: 35
            placeholderText: "Envia:"
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        FlatInput {
            id: recibe
            width: parent.width/3
            height: 35
            placeholderText: "Recibe:"
            anchors.leftMargin: 10
            anchors.left: envia.right
            anchors.top: parent.top
            anchors.topMargin: 20
        }

        FlatInput {
            id: motivo
            height: 35
            anchors.right: parent.right
            anchors.rightMargin: 10
            placeholderText: "Motivo:"
            anchors.leftMargin: 10
            anchors.left: recibe.right
            anchors.top: parent.top
            anchors.topMargin: 20
        }
    }

    Grid {
        id: grid1
        width: 700
        height: 312
        anchors.top: row1.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 10

        TextArea {
            id: textArea1
            width: parent.width/2.1
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
        }

        TextArea {
            id: textArea2
            width: parent.width/2.1
            anchors.left: textArea1.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
        }
    }

    FlatInfoButton {
        id: guardarTraslado
        x: 503
        height: 35
        text: "Guardar"
        anchors.top: grid1.bottom
        anchors.topMargin: 10
    }

}
