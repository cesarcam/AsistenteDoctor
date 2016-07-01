import QtQuick 2.0
import QtQuick.Controls 1.3

Item{

    id:alergias
    width: parent.width
    height: 600
    TextArea {
        id: textArea1
        y: 36
        width: 350
        height: 153
        anchors.left: parent.left
        anchors.leftMargin: 41
    }

    TextArea {
        id: textArea2
        x: 41
        y: 210
        width: 544
        height: 153
    }

    TextArea {
        id: textArea3
        x: 41
        y: 394
        width: 544
        height: 153
    }

}
