import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    id: item1
    width: 700
    height: 600
    TabView{
        anchors.bottom: flatButton1.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottomMargin: 10
        Tab{
            id: tab1
            title: "Tratamiento"
            TextArea {
                id: tratamiento
                anchors.fill: parent
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }
        }
        Tab{
            title: "Plan"
            TextArea {
                id: plan
                anchors.fill: parent
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }
        }
        Tab{
            id: tab2
            title: "Control"
            TextArea {
                id: control
                anchors.fill: parent
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.leftMargin: 10
                anchors.rightMargin: 10
            }
        }
        style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color: styleData.selected ? "steelblue" :"lightsteelblue"
                border.color:  "steelblue"
                implicitWidth: Math.max(text.width+ 4, 200)
                implicitHeight: 50
                radius: 2
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: styleData.title
                    color: styleData.selected ? "white" : "black"
                }
            }
            frame: Rectangle { color: "white" }
        }
    }

    FlatButton {
        id: flatButton1
        x: 474
        y: 555
        height: 35
        radius: 2
        text: "Guardar"
        defaultColor: qsTr("#3498db")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
}
