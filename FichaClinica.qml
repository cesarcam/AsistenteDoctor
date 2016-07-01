import "../flatui"
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.4
Item {
    id: item1
    property var section;
    ScrollView
    {
        x: menuFichaClinica.width
        y: 0
        width: parent.width
        height: parent.height
        Loader{id:contenidoFicha}
    }
    Row {
        id: menuFichaClinica
        x: 0
        y: 0
        width: 230
        height: parent.height
        ListView {
            id:lista_fichaClinica
            anchors.fill: parent
            model: nestedModel
            delegate: categoryDelegate
            focus:true

        }
        ListModel {
            id: nestedModel
            ListElement {
                categoryName: "Patologicos"
                collapsed: true
                subItems: [
                    ListElement { itemName: "Padecimientos" },
                    ListElement { itemName: "Traumas"           ;separator:true },
                    ListElement { itemName: "Hospitalizaciones" ;separator:true},
                    ListElement { itemName: "Quirurgicos"       ;separator:true },
                    ListElement { itemName: "Inmunizaciones" }
                ]
            }
            ListElement {
                categoryName: "No patologicos"
                collapsed: true
                subItems: [
                    ListElement { itemName: "Grupo sanguineo" },
                    ListElement { itemName: "Alergias";separator:true }
                ]
            }
            ListElement {
                categoryName: "Heredofamiliares"
            }
            ListElement {
                categoryName: "Gineco Obstetricos"
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
                            categoryItem.color = "#f1f1f1"
                            if(index == 2){
                                animacion.visible = false
                                console.log('Destrunyendo...');
                                console.log('cargando..');
                                contenidoFicha.source ="/componentes/Heredofamiliares.qml"
                            }
                            else if(index == 3){
                                animacion.visible = false
                                console.log('Destrunyendo...');
                                console.log('cargando..');
                                contenidoFicha.source ="/componentes/GinecoObstetricos.qml"
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
                        width: 210
                        FlatRadioButton{
                            id:radioButton
                            anchors.verticalCenter: parent.verticalCenter
                            x: 30
                            text: itemName

                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked:{
                                    animacion.visible = false
                                    if(radioButton.checked){
                                        radioButton.checked = false
                                    }else{
                                        radioButton.checked = true
                                    }
                                    lista_fichaClinica.currentIndex = index
                                    section =  subItemRepeater.model.get(lista_fichaClinica.currentIndex).itemName//sacar el nombre del indice que se selecciona
                                    if(section == 'Padecimientos' && radioButton.checked){
                                        console.log('cargando..');
                                        contenidoFicha.source ="/componentes/Padecimientos.qml"
                                    }else if(section == 'Traumas' && radioButton.checked){
                                        console.log('Destrunyendo...');
                                        console.log('cargando..');
                                        contenidoFicha.source = "/componentes/Traumas.qml"
                                    }
                                    else if(section == 'Hospitalizaciones' && radioButton.checked){
                                        console.log('Destrunyendo...');
                                        console.log('cargando..');
                                        contenidoFicha.source = "/componentes/Hospitalizaciones.qml"
                                    }
                                    else if(section == 'Quirurgicos' && radioButton.checked){
                                        console.log('Destrunyendo...');
                                        console.log('cargando..');
                                        contenidoFicha.source = "/componentes/Quirurgicos.qml"
                                    }
                                    else if(section == 'Inmunizaciones' && radioButton.checked){
                                        console.log('Destrunyendo...');
                                        console.log('cargando..');
                                        contenidoFicha.source = "/componentes/Inmunizaciones.qml"
                                    }
                                    else if(section == 'Grupo sanguineo' && radioButton.checked){
                                        console.log('Destrunyendo...');
                                        console.log('cargando..');
                                        contenidoFicha.source = "/componentes/GrupoSanguineo.qml"
                                    }
                                    else if(section == 'Alergias' && radioButton.checked){
                                        console.log('Destrunyendo...');
                                        console.log('cargando..');
                                        contenidoFicha.source = "/componentes/Alergias.qml"
                                    }
                                }
                                onEntered: {
                                    parent.opacity = 0.9;
                                }
                                onExited: {
                                    parent.opacity = 1;
                                }
                            }//<-- fin de mouse area -->
                        }
                    }
                }
            }
        }
    }

    AnimatedImage {
        id: animacion
        y: 85
        anchors.left: menuFichaClinica.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.verticalCenter: menuFichaClinica.verticalCenter
        fillMode: Image.PreserveAspectFit
        source: "qrc:/img/img/hex-loader.gif"
    }

}
