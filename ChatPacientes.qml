import "../flatui"
import "../controlador/crearMensaje.js" as Crear
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles.Flat 1.0
import QtQuick.Dialogs 1.2





Item {
    id: item1

    Flow {

        width: 800
        height: 1000
        id: flow1
        anchors.bottom: row1.top
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: column1.right
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10

        Rectangle{
            anchors.fill: parent
            color: "#ffffff"
        }

        ScrollView {
            id: scrollView2
            anchors.fill: parent


            Rectangle {
                id: chat
                width: parent.width
                height: 2000
                x: 0
                y: 0

                color : "white"
                border.width: 0
                scale: 1
                Loader{
                    id:cargarMensajes
                }





            }


        }
    }
    Row {
        id: row1
        y: 430
        height: 40
        anchors.left: column1.right
        anchors.leftMargin: 10
        anchors.right: tomarFoto.left
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10


        FlatInput{
            id:mensajeNuevo
            anchors.fill: parent
            placeholderText: qsTr("Ingresa tu mensaje")


        }

    }

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
                            contenidoFicha.source = "/componentes/ConsultaVista.qml"
                        }
                    }
                }

                Image {
                    id: barImage
                    anchors.right: parent.right
                    anchors.rightMargin:20
                    anchors.verticalCenter: parent.verticalCenter
                    width:  40
                    height: 40
                }

            }

        }


    }

    Button {

        id: enviarMensaje
        x: 600
        y: 430
        width: 40
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        MouseArea{
            anchors.fill: parent
            onClicked: {
                cargarMensajes.source = Crear.Mensaje(mensajeNuevo.text.toString());
            }

        }


        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40

            }
        }

        Image {

            anchors.horizontalCenter: parent
            id: enviar
            x: 0
            y: 0
            width: 40
            height: 40

            source: "qrc:/img/img/send-button.png"
        }


    }

    Button {
        id: adjuntarArchivo
        x: 548
        y: 423
        width: 40
        height: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: enviarMensaje.left
        anchors.rightMargin: 10

        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40

            }
        }


        Image {

            id: adjuntar
            width: 40
            height: 40
            source: "qrc:/img/img/clip.png"

            MouseArea{
                anchors.fill: parent
                onClicked: {

                    abrirDocumento.visible=true
                }
            }

        }

        FileDialog{
            id:abrirDocumento
            nameFilters: [ "Doc files (*.docx *.pdf *.xlsx)", "All files (*)" ]
            onAccepted: {
                console.log("You chose: " + abrirFoto.fileUrls)
            }
        }
    }


    Button {

        id: tomarFoto
        x: 439
        y: 430
        width: 40
        height: 40
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: adjuntarArchivo.left
        anchors.rightMargin: 10

        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40

            }

        }

        Image {

            id: foto
            x: 0
            y: 0
            width: 40
            height: 40
            source: "qrc:/img/img/camara.png"
            MouseArea{
                anchors.fill: parent
                onClicked: {

                    abrirFoto.visible=true
                }
            }

        }

        FileDialog{
            id:abrirFoto
            nameFilters: [ "Image files (*.jpg *.png)", "All files (*)" ]
            onAccepted: {
                console.log("You chose: " + abrirFoto.fileUrls)
            }
        }
    }

}
