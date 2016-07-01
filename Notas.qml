import "../flatui"
import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
Item {
    id: notas

    SplitView {
        id: splitView1
        anchors.fill: parent
        orientation: Qt.Horizontal

        Rectangle {
            id: rectangle1
            width: 200
            ListModel {
                id: modeloNota
                ListElement {
                    DescripcionNota: "nota numero 1"
                    fecha: "02/05/2016"
                }
                ListElement {
                    DescripcionNota: "nota numero 2"
                    fecha: "02/05/2016"
                }

            }

            TableView {
                id:observacionTabla
                anchors.bottom: flatInput2.top
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 40
                TableViewColumn {
                    role: "DescripcionNota"
                    title:  "Nota"
                    width: 250
                }
                TableViewColumn {
                    role: "fecha"
                    title: "fecha"
                    width: 250
                }
                model: modeloNota


                style: TableViewStyle {
                    headerDelegate: Rectangle {
                        height: 70
                        width: 200
                        color: "#3693d2"
                        Text {
                            id: textItem
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: styleData.textAlignment
                            anchors.leftMargin: 50
                            text: styleData.value
                            elide: Text.ElideRight
                            color: "white"
                            renderType: Text.NativeRendering
                        }
            }
            }
            }
            Text {
                height: 28
                text: "<h2>Notas</h2>"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 10
            }

            FlatInput {
                id: flatInput2
                y: 417
                height: 40
                text: ""
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.rightMargin: 10
                placeholderText: "Ingresa tus notas"
                anchors.right: flatInfoButton2.left
                validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,150}$/}
            }

            FlatInfoButton {
                id: flatInfoButton2
                x: 450
                y: 420
                width: 180
                height: 40
                radius: 0
                text: "Guardar"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.rightMargin: 10
                anchors.right: parent.right
            }

        }

        Rectangle {
            id: rectangle2
            width: 200
            Text {
                width: 156
                height: 56
                text: "<h2>Observaciones</h2>"
                visible: rectangle2.width < 120 ? false:true
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 10
            }

            ListModel {
                id: modeloObservacion
                ListElement {
                    DescripcionObservacion: "Observacion numero 1"
                    fecha: "02/05/2016"
                }
                ListElement {
                    DescripcionObservacion: "Observacion numero 2"
                    fecha: "02/05/2016"
                }

            }

            TableView {
                id:notaTabla
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.bottom: flatInput1.top
                anchors.bottomMargin: 10
                anchors.topMargin: 40
                anchors.top: parent.top
                TableViewColumn {
                    role: "DescripcionObservacion"
                    title:  "Observacion"
                    width: 250
                }
                TableViewColumn {
                    role: "fecha"
                    title: "fecha"
                    width: 250
                }
                model: modeloObservacion


                style: TableViewStyle {
                    headerDelegate: Rectangle {
                        height: 70
                        width: 200
                        color: "#3693d2"
                        Text {
                            id: text1
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: styleData.textAlignment
                            anchors.leftMargin: 50
                            text: styleData.value
                            elide: Text.ElideRight
                            color: "white"
                            renderType: Text.NativeRendering
                        }
            }
            }
}

            FlatInfoButton {
                id: flatInfoButton1
                x: 8
                y: 427
                width: 180
                visible: rectangle2.width < 120 ? false:true
                height: 40
                radius: 0
                text: "Guardar"
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
            }

            FlatInput {
                id: flatInput1
                y: 425
                height: 40
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                placeholderText: "Ingresa tus observaciones"
                anchors.right: flatInfoButton1.left
                anchors.rightMargin: 10
                validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,150}$/}
            }
        }

    }
}
