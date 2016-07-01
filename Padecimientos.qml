import QtQuick 2.0
import QtQuick.Controls 1.3
import "../flatui"
Item {
    width: parent.width
    height: parent.height
    id: item1
    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "Selecciona los padecimientos"
            collapsed: true
            subItems: [
                ListElement { itemName: "Varicela" },
                ListElement { itemName: "Rubeola" },
                ListElement { itemName: "Sarampion" },
                ListElement { itemName: "Paroditis" },
                ListElement { itemName: "Transfucion" }
            ]
        }
       ListElement {
            categoryName: "Seleccione los habitos"
            collapsed: true
            subItems: [
                ListElement { itemName: "Exfumador" },
                ListElement { itemName: "Exalcoholico" },
                ListElement { itemName: "Exdrogadicto" },
                ListElement { itemName: "Otro" }
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
        height: 500
    ListView {
        id: padecimientos
        delegate: categoryDelegate
        anchors.fill: parent
        model: nestedModel
        orientation: ListView.Vertical
        focus: true
        snapMode: ListView.SnapToItem
    }
    }

}
