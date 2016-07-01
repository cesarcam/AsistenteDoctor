import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles.Flat 1.0


Item {
    id: item1
    property alias buscar: buscar


    Column {
        id: column1
        width: 200
        height: 600
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        Rectangle{
            anchors.fill: parent
            color: "#ffffff"
            anchors.topMargin: 52
        }

        FlatSearchInput{
            id:buscar
            width: 200
            height: 50
            color: "#3498db"
            activeColor: "#ffffff"
            defaultColor: "#3498db"
            inactiveColor: "#ffffff"
            selectedTextColor: "#ffffff"
            border.color: "#ffffff"


        }


        ScrollView{
            id: scrollView1
            width: 200
            height: 60
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 52


            ListView {
                id:lista_fichaClinica
                width: 200
                height: 600
                spacing: 2
                model: nestedModel
                delegate: categoryDelegate
                focus:true
            }
        }
    }

    ListModel {
        id: nestedModel
        ListElement {
            categoryName: "Paciente 1"
        }
        ListElement {
            categoryName: "Paciente 2"
        }
        ListElement {
            categoryName: "Paciente 3"
        }
        ListElement {
            categoryName: "Paciente 4"
        }
        ListElement {
            categoryName: "Paciente 5"
        }
        ListElement {
            categoryName: "Paciente 6"
        }
        ListElement {
            categoryName: "Paciente 7"
        }


    }

    Component {
        id: categoryDelegate
        Column {

            Rectangle {
                width: 200
                height: 100
                id: categoryItem

                Grid{
                    id:imagenPerfil
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: 60

                    Item {

                        width: 60
                        //anchors.fill: parent
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom



                        Image {

                            x:8
                            y:22
                            id: perfil
                            source: "qrc:/img/img/profile.jpg"
                            sourceSize: Qt.size(parent.width, parent.height)
                            visible: false
                        }
                        Image {
                            id: enmascarar
                            source: "qrc:/img/img/circle.png"
                            sourceSize: Qt.size(parent.width, parent.height)
                            smooth: true
                            visible: false
                        }
                        OpacityMask {anchors.fill: perfil;source: perfil;maskSource: enmascarar}
                    }


                }
                Row{
                    x:72
                    y:15

                    Text {
                        id:textoMensaje
                        font.pixelSize: 15
                        text: categoryName

                    }


                }

                Item{
                    x:70
                    y:40
                    Image {
                        id: direc
                        source: "qrc:/img/img/localizar.png"
                        sourceSize: Qt.size(parent.width, parent.height)
                        width: 15
                        height: 15

                    }
                }

                Row{
                    x:90
                    y:42

                    Text {
                        id:direccion
                        font.pixelSize: 10
                        text: "Villa de cortez"
                    }

                }

                Row{
                    x:73
                    y:60

                    Text {
                        id:eda
                        font.pixelSize: 11
                        text: "<strong>Edad:</strong>"
                    }
                }
                Row{
                    x:110
                    y:61

                    Text {
                        id:edad
                        font.pixelSize: 10
                        text: "30"

                    }
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
                        console.log(index);//indicara el index 2 y 3
                        if(index == 0){
                            console.log('Destruyendo...');
                            console.log('cargando..');
                            contenidoFicha.source ="/componentes/padecimientoActual.qml"
                        }else if(index == 1){
                            contenidoFicha.soutrce = "/componentes/ConsultaVista.qml"
                        }
                    }
                }





            }
        }
    }

    Flow {
        id: flow1
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: column1.right
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10

        Row {
            id: banner
            height: 150
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            Image {
                id: backperfil
                height: 150
                anchors.fill: parent
                source: "qrc:/img/img/backPerfil.jpg"
            }
            Item {
                id:imagenPerfil
                height: 80
                z: 1
                anchors.horizontalCenterOffset: -40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: 45
                anchors.verticalCenter: parent.verticalCenter


                Image {

                    x:8
                    y:22
                    id: perfil
                    source: "qrc:/img/img/profile.jpg"
                    sourceSize: Qt.size(parent.width, parent.height)
                    visible: false
                }
                Image {
                    id: enmascarar
                    x: 6
                    y: 22
                    source: "qrc:/img/img/circle.png"
                    sourceSize: Qt.size(parent.width, parent.height)
                    smooth: true
                    visible: false
                }
                OpacityMask {anchors.fill: perfil;source: perfil;maskSource: enmascarar}
            }

        }

        Row {
            id: row2
            height: 100
            z: -1
            anchors.top: banner.bottom
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 0
            spacing: 2

            Rectangle{
                id: rectangle1
                width: parent.width/3
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0

                Text {
                    id: nombre
                    text: qsTr("Nombre:")
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    horizontalAlignment: Text.AlignLeft
                }

                Text {
                    id: edad
                    text: qsTr("Edad:")
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 60
                }
            }
            Rectangle{
                id: rectangle2
                width: parent.width/3
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0

                Text {
                    id: direccion
                    text: qsTr("Direccion:")
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 40
                }

                Text {
                    id: telefono
                    text: qsTr("Telefono:")
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 70
                }
            }
            Rectangle{
                id: rectangle3
                width: parent.width/3
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0

                Text{
                    id:correo
                    text: qsTr("Correo electronico:")
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 20
                }


                Text{
                    id:enviar
                    text: qsTr("Enviar mensaje")
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.top: parent.top
                    anchors.topMargin: 60
                }
                Button{
                    id:enviarmensaje
                    anchors.top: parent.top
                    anchors.topMargin: 50
                    anchors.left: parent.left
                    anchors.leftMargin: 190


                    MouseArea{

                        anchors.fill: parent
                        onClicked:{
                            item1.visible = true
                            loaderContenedorGeneral.source= "qrc:/componentesLaterales/ChatPacientes.qml"

                        }
                    }
                    style: ButtonStyle {
                        background: Rectangle {
                            implicitWidth: 40
                            implicitHeight: 40

                        }

}
                        Image {
                            visible:true
                            id: enviarm
                            width: 40
                            height: 40
                            source: "qrc:/img/img/enviarmensaje.png"

                        }


                }
            }
        }


        ListModel {
            id: datosModel
            ListElement {
                enfermedad: "Lession en pie izquierdo"
                padecimiento: "02/05/2016"
            }
            ListElement {
                enfermedad: "Lession dedo gordo"
                padecimiento: "02/01/2016"
            }
            ListElement {
                enfermedad: "Lession en pie izquierdo"
                padecimiento: "02/05/2016"
            }
            ListElement {
                enfermedad: "Lession dedo gordo"
                padecimiento: "02/01/2016"
            }
        }
        TableView {
            id: tablaDatos
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: row2.bottom
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0


            TableViewColumn {
                role: "enfermedad"
                title:"Dato 1"
                width: 150
            }
            TableViewColumn {
                role: "padecimiento"
                title: "Dato 2"
                width:150
            }
            TableViewColumn {
                role: "dato 3"
                title: "Dato 3"
                width:150
            }
            TableViewColumn {
                role: "dato 4"
                title: "Dato 4"
                width:150
            }
            TableViewColumn {
                role: "dato 5"
                title: "Dato 5"
                width:150
            }
            TableViewColumn {
                role: "dato 6"
                title: "Dato 6"
                width:150
            }

            TableViewColumn {
                role: "dato 7"
                title: "Dato 7"
                width:150
            }
            model: datosModel
            //INICIA LA MODIFICACION DEL COLOR DE LA TABLA//

                    style: TableViewStyle {
                        headerDelegate: Rectangle {
                            height: 60
                            width: 200
                            color: "#0492c2"
                            Text {
                                id: textItem
                                anchors.fill: parent
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: styleData.textAlignment
                                anchors.leftMargin: 50
                                text: styleData.value
                                elide: Text.ElideRight
                                color: "#ffffff"
                                renderType: Text.NativeRendering
                            }
                }

                        //FIN DE LA MODIFICACION DEL COLOR DE LA TABLA//
                }




        }


    }

}
