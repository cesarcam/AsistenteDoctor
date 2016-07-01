import QtQuick.Window 2.2
import QtQuick 2.5


Rectangle {
    id: conversacion
    property string texto
    color: "#3498db"
    width: 300
    height: t.height + 50
    radius: 15

    Text {
        id:t
        color: "#ffffff"
        text: formatoTexto.text
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        textFormat: Text.RichText
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 10
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#ffffff"
        font: formatoTexto.font
        anchors.left: parent.left
        wrapMode: Text.WordWrap


    }
    TextMetrics {
        id: formatoTexto
        font.family: "Arial"
        font.pixelSize: 15
        text: texto

}
}
