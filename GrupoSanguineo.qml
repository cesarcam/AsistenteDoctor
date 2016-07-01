import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
Item{
    id:grupoSanguineo
    height: 800

    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "Tipo Sanguineo"
            collapsed: true
            subItems: [
                ListElement { itemName: "A Rh Negativo " },
                ListElement { itemName: "B Rh Positivo" },
                ListElement { itemName: "AB Rh Positivo" },
                ListElement { itemName: "O Rh  Negativo" }
            ]
        }
        ListElement {
            categoryName: "Habitos"
            collapsed: true
            subItems: [
                ListElement { itemName: "Tabaquismo" },
                ListElement { itemName: "Consume Drogas" },
                ListElement { itemName: "Consume Bebidas Alcoholicas" }
            ]
        }
    }


    Component {

        id: categoryDelegate
        Column {
            spacing: 20
            width: parent.width
            Rectangle {
                id: categoryItem
                color: "#f1f1f1"
                height: 50
                width: parent.width
                Text {
                    id:categoria
                    x: 15
                    font.pixelSize: 18
                    text: categoryName
                    anchors.verticalCenter: parent.verticalCenter
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        categoryItem.opacity = 0.6;
                    }
                    onExited: {
                        categoryItem.opacity = 1;
                    }
                    onClicked: {
                        nestedModel.setProperty(index, "collapsed", !collapsed)
                        console.log(index);//indicara el index 2 y 3
                    }

                }

            }
            Loader {
                id: subItemLoader
                visible: !collapsed
                property variant subItemModel : subItems
                sourceComponent: collapsed ? null : subItemColumnDelegate
                onStatusChanged: if (status == Loader.Ready) item.model = subItemModel
            }
        }
    }
    Component {
        id: subItemColumnDelegate
        Column {
            property alias model : subItemRepeater.model
            width: 200
            Repeater {

                id: subItemRepeater
                delegate: Rectangle {
                    color: "#fff"
                    height: 40
                    width: 750
                    FlatCheckBox{
                        id:checkButton
                        text: itemName
                        anchors.verticalCenter: parent.verticalCenter
                        x: 30
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked:{
                                lista_fichaClinica.currentIndex = index
                                section =  subItemRepeater.model.get(lista_fichaClinica.currentIndex).itemName//sacar el nombre del indice que se selecciona
                                console.log(section);
                                if(checkButton.checked){
                                    checkButton.checked = false
                                }else{
                                    checkButton.checked = true
                                }
                            }
                            onEntered: {
                                parent.opacity = 0.9;
                            }
                            onExited: {
                                parent.opacity = 1;
                            }
                        }
                    }
                }
            }
        }
    }


    Column {
        id: column1
        width: 750
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        ListView {
            id: padecimientos
            highlightRangeMode: ListView.StrictlyEnforceRange
            flickDeceleration: 1499
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.top: parent.top
            boundsBehavior: Flickable.StopAtBounds
            delegate: categoryDelegate
            model: nestedModel
            orientation: ListView.Vertical
            focus: true
            snapMode: ListView.SnapToItem
            z: 5
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
        id: alimentos
        x: 15
        y: 195
        width: 86
        height: 13
        text: qsTr("Actividad deportiva/Hobbies")
        textFormat: Text.PlainText
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
        text: qsTr("Viajes Recientes")
        font.pixelSize: 12
    }

    FlatSuccessButton {
        id: flatSuccessButton1
        x: 424
        text: "Guardar"
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
        anchors.horizontalCenterOffset: 200
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textArea3.bottom
        anchors.topMargin: 10
        padding: 93
    }
    }

}
