import QtQuick 2.0
import QtQuick.Controls 1.4
Item {
    id: item1
    width: 700
    height: 600
    TabView{
        anchors.fill: parent
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
    }

}
