import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    id: item1
    TextArea {
        id: textArea1
        width: 680
        height: 200
        text: ""
        anchors.top: parent.top
        anchors.topMargin: 38
        anchors.left: parent.left
        anchors.leftMargin: 8
    }

    FlatInput {
        id: valor1
        x: 16
        width: 100
        height: 35
        anchors.top: textArea1.bottom
        anchors.topMargin: 20
        placeholderText: "valor 1"
        validator: RegExpValidator {regExp: /^[0-9]{1,3}$/}
    }

    FlatInput {
        id: valor2
        width: 100
        height: 35
        anchors.top: textArea1.bottom
        anchors.topMargin: 20
        placeholderText: "valor 2"
        anchors.left: valor1.right
        anchors.leftMargin: 10
        validator: RegExpValidator {regExp: /^[0-9]{1,2}$/}
    }

    FlatInput {
        id: valor3
        width: 100
        height: 35
        anchors.top: textArea1.bottom
        anchors.topMargin: 20
        placeholderText: "valor 3"
        anchors.left: valor2.right
        anchors.leftMargin: 10
        validator: RegExpValidator {regExp: /^[0-9]{1,2}$/}
    }

    FlatInput {
        id: valor4
        x: -2
        width: 100
        height: 35
        anchors.top: textArea1.bottom
        anchors.topMargin: 20
        anchors.left: valor3.right
        placeholderText: "valor 4"
        anchors.leftMargin: 10
        validator: RegExpValidator {regExp: /^[0-9]{1,2}$/}
    }

    FlatSuccessButton {
        id: guardarValores
        width: 180
        height: 35
        radius: 0
        text: "Guardar"
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
        anchors.top: textArea1.bottom
        anchors.topMargin: 20
        anchors.left: valor4.right
        anchors.leftMargin: 50
    }

}
