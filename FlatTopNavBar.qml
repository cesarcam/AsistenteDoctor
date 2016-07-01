import QtQuick 2.4
import "."

Rectangle {
    id: root
    width: 500
    height: 55
    color: "#ffffff"
    radius: 0

    property bool searchBarVisible: false   

    FlatSearchInput {
        width: 600
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        radius: 0
        border.color: "#f6f6f6"
        inactiveColor: "#eaeeef"
        activeColor: "#c4b1b1"
        selectedTextColor: "#c4b1b1"
        defaultColor: "#eaeeef"
        anchors.left: parent.left
        anchors.leftMargin: 10
        visible: root.searchBarVisible

    }
}

