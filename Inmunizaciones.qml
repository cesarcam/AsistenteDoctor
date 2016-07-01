import QtQuick 2.0
import QtQuick.Controls 1.3
import "../flatui"
Item {

    id: inmunizaiones
    anchors.fill: parent
    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "Selecciona los padecimientos"
            collapsed: true
            subItems: [
                ListElement { itemName: "Tuberculosis" },
                ListElement { itemName: "Tosferina" },
                ListElement { itemName: "Meningoccocica" },
                ListElement { itemName: "Rubeola" },
                ListElement { itemName: "H. Influenzae A" },
                ListElement { itemName: "Poliomelitis" }
            ]
        }
    }
    TextArea {
        id: textArea1
        width: 690
        height: 150
        anchors.leftMargin: 10
        x: 0
        y: 254
        z: 1
    }

    Text {
        id: text1
        y: 225
        text: qsTr("Otros/Observaciones")
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.pixelSize: 12
    }

    Component {
        id: categoryDelegate
        Column {
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
        height: 219
        anchors.bottom: text1.top
        anchors.bottomMargin: 6

        ListView {
            id: padecimientos
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 219
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.top: parent.top
            delegate: categoryDelegate
            model: nestedModel
            orientation: ListView.Vertical
            focus: true
            snapMode: ListView.SnapToItem


        }

    }

    FlatSuccessButton {
        id: guardarInmunizaciones
        x: 480
        y: 410
        width: 216
        radius: 4
        text: "Guardar"
        pointSize: 13
    }





}
