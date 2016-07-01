import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.0
import QtQuick.Controls.Styles 1.4
import "../flatui"

Item {
    property var seccionConsultas;
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
                categoryName: "Padedimiento actual"
            }
           ListElement {
                categoryName: "Consultas"
                collapsed: true
                subItems: [
                    ListElement { itemName: "Interrogatorio" },
                    ListElement { itemName: "Diagnostico"},
                    ListElement { itemName: "Exploracion"},
                    ListElement { itemName: "Notas Evolutivas"},
                    ListElement { itemName: "Laboratorio"},
                    ListElement { itemName: "Nota Interconsulta"},
                    ListElement { itemName: "Terapeutica"},
                    ListElement { itemName: "Nota Ref/Traslado"}
                ]
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
                            if(index == 0){
                               console.log('Destrunyendo...');
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
                                if(radioButton.checked){
                                    radioButton.checked = false
                                }else{
                                    radioButton.checked = true
                                }
                                lista_fichaClinica.currentIndex = index
                                seccionConsultas =  subItemRepeater.model.get(lista_fichaClinica.currentIndex).itemName//sacar el nombre del indice que se selecciona
                                console.log(seccionConsultas);
                                if(seccionConsultas == 'Interrogatorio' && radioButton.checked){
                                    console.log('cargando..');
                                    contenidoFicha.source ="/componentes/Interrogatorio.qml"
                                }else if(seccionConsultas == 'Diagnostico' && radioButton.checked){
                                    console.log('Destrunyendo...');
                                    console.log('cargando..');
                                    contenidoFicha.source = "/componentes/Diagnostico.qml"
                                }
                                else if(seccionConsultas == 'Exploracion' && radioButton.checked){
                                    console.log('Destrunyendo...');
                                    console.log('cargando..');
                                    contenidoFicha.source = "/componentes/Exploracion.qml"
                                }
                                else if(seccionConsultas == 'Notas Evolutivas' && radioButton.checked){
                                    console.log('Destrunyendo...');
                                    console.log('cargando..');
                                    contenidoFicha.source = "/componentes/NotaEvolutiva.qml"
                                }
                                else if(seccionConsultas == 'Laboratorio' && radioButton.checked){
                                    console.log('Destrunyendo...');
                                    console.log('cargando..');
                                    contenidoFicha.source = "/componentes/Laboratorio.qml"
                                }
                                else if(seccionConsultas == 'Nota Interconsulta' && radioButton.checked){
                                    console.log('Destrunyendo...');
                                    console.log('cargando..');
                                    contenidoFicha.source = "/componentes/NotaInterconsulta.qml"
                                }
                                else if(seccionConsultas == 'Terapeutica' && radioButton.checked){
                                    console.log('Destrunyendo...');
                                    console.log('cargando..');
                                    contenidoFicha.source = "/componentes/NotaTerapeutica.qml"
                                }
                                else if(seccionConsultas == 'Nota Ref/Traslado' && radioButton.checked){
                                    console.log('Destrunyendo...');
                                    console.log('cargando..');
                                    contenidoFicha.source = "/componentes/NotaTraslado.qml"
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

}
