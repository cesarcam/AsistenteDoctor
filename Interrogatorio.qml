import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3

Item {
    property var section;
    id: item1
    width: 750
    height: 600
    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "Elige el sitema"
            collapsed: true
            subItems: [
                ListElement { itemName: "Musculoesqueletico" },
                ListElement { itemName: "nervioso" },
                ListElement { itemName: "respiratorio" },
                ListElement { itemName: "digestivo" },
                ListElement { itemName: "urogenital" },
                ListElement { itemName: "endocrino" },
                ListElement { itemName: "inmune" },
                ListElement { itemName: "tegumentario" }

            ]
        }
    }

    /////// PRIMER COMPONENTE DROP DOWN /////////|
    TextArea {
        id: textArea1
        y: 500
        width: 294
        height: 365
        anchors.left: imagen.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 79
    }

    FlatSuccessButton {
        id: guardarObservacion
        x: 534
        anchors.top: textArea1.bottom
        anchors.topMargin: 6
        text: "Guardar"
    }

    Flickable{
        id: imagen
        width: 450
        height: 534
        anchors.left: parent.left
        anchors.leftMargin: 10
        y: 58
        clip:true
        contentWidth: cargarImagen.width; contentHeight: cargarImagen.height
        Loader {
            id: cargarImagen
        }
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
    ////////////// SEGUNDO COPMPONENTE DEL DROPDOWN /////////|
    Component {
        id: subItemColumnDelegate
        Column {
            property alias model : subItemRepeater.model
            width: 750
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
                                if(section == "Musculoesqueletico"){
                                    cargarImagen.source ="qrc:/componentesInterrogatorio/Muscular.qml"
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
        height: 90
        ListView {
            id: padecimientos
            width: 650
            delegate: categoryDelegate
            anchors.fill: parent
            model: nestedModel
            orientation: ListView.Vertical
            focus: true
            snapMode: ListView.SnapToItem
        }

        Text {
            id: text1
            x: 460
            y: 60
            text: qsTr("Observaciones")
            font.pixelSize: 12
        }
    }


}
