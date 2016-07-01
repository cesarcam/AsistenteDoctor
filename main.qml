import "vistas"
import "flatui"
import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.2
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.0
import QtQuick.Extras 1.0
import QtQuick.Controls.Styles.Flat 1.0
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import "componentesLaterales"
import "../modelo/Modelo.js" as DB
import "../modelo/CreacionTablasBase.js" as Tablas1
import "../modelo/modeloTablas.js" as Tablas12
import QtQuick.LocalStorage 2.0

Window {

    Component.onCompleted: {
        Tablas1.crear()
    }
    property string id_paciente1: ""
    property string foto1: ""
    property string fechaNacimiento1: ""
    property string apellido123: ""
    property string apellido12: ""
    property string nombre123 : ""
    property string rfc1: ""
    property string curp1: ""
    property string ocupacion1: ""
    property string estadocivil1: ""
    property string edad1: ""
    property string estatura1: ""
    property string peso1: ""
    property string telefonoParticula1: ""
    property string telefonoOficina1: ""
    property string celular1: ""
    property string religion1: ""
    property string referenciado1: ""
    property string email1: ""
    property string calleNumero1: ""
    property string pais1: ""
    property string codigoPostal1:""
    property string estadoRegion1: ""
    property string colonia1: ""
    property string ciudad1: ""
    property string sexo1: ""

    property string aseguradora1: ""
    property string poliza1: ""
    property string nombre1: ""
    property string fechaExpedicion1: ""
    property string fechaExpiracion1: ""
    property string familiar12: ""
    property string familiar13: ""
    property string telefonoFam1: ""
    property string telefonoFam2: ""
    property string observacion1: ""

    //flags: Qt.FramelessWindowHint
    id: ventanaPrincipal
    visible: true
    ///////////////////////////////////////////////////////////|
    ///// <scaleFactor> mide la densidad que tiene la pantalla/|
    ///// y la divide entre el estandar para linux que  es   //|
    ///// 5 para poder cuadrar en todas las distribuciones LX//|
    ///////////////////////////////////////////////////////////|
    ////  <intScaleFactor> convierte a entero resultado de:  //|
    ////            <scaleFactor>               ///////////////|
    ///////////////////////////////////////////////////////////|
    property real   scaleFactor: Screen.pixelDensity / 5.0
    property int    intScaleFactor: Math.max(1, scaleFactor)
    property int    anchoPantalla: 1390
    property int    altoPantalla: 800
    property int    duration: 3000
    property bool   menu_shown: false
    property string colorGeneralControles: "#2980b9"
    property var seccion

    color: "#ecf0f1"
    width: anchoPantalla*scaleFactor
    height: altoPantalla*scaleFactor
    minimumWidth:  anchoPantalla * scaleFactor
    minimumHeight: altoPantalla * scaleFactor


    Flow
    {
        id: contenedorGeneral
        z: 0
        anchors.bottomMargin: -1
        anchors.topMargin: 80
        anchors.leftMargin: 80
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        Loader{
            anchors.fill: parent
            id:loaderContenedorGeneral
        }

        ExpedienteClinico{id:expediente}
        Agenda{id:agenda}
        ListaDeEnfermedades{id:listaEnfermedades}
        //CalculadoraMedica{id:calculadora}
        Estadisticas{id:estadisticas}
        AsistenteDeRecetas{id:asistenteRecetas}
        ListaGeneralDeEstudios{id:listaEstudios}
        Medicamentos{id:medicamento}
        ConsultarHistorialDelPaciente{id:historialPaciente}
        //ManualdeAyuda{id:manual}
    }
    Row
    {
        id: contenedorBarraLateral
        width: 80
        anchors.left: parent.left
        anchors.leftMargin: -81
        anchors.topMargin: 0
        anchors.bottomMargin: -1
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        z:5
        ////////////////////////////////////////////|
        /////INICIA LA BARRA LATERAL ///////////////|
        ////////////////////////////////////////////|
        Rectangle {
            id: menu_screen
            height: parent.height
            color:"#ffffff"
            radius: 0
            x: -177
            Behavior on x { NumberAnimation { } }
            width: 250




            ListView {
                id:menuPrincipal
                anchors.topMargin: 0
                anchors.fill: parent
                model: nestedModel
                delegate: categoryDelegate
                focus:true

            }

            ListModel {
                id: nestedModel
                ListElement {
                    categoryName: "Doctor Personal"
                }
                ListElement {
                    categoryName: "Archivo"
                    collapsed: true
                    subItems: [
                        ListElement { itemName: "Abrir base" },
                        ListElement { itemName: "Guardar estado actual";separate:true },
                        ListElement { itemName: "Crear respaldo" ;separate:true},
                        ListElement { itemName: "Recuperar respaldo"}
                    ]
                }
                ListElement {
                    categoryName: "Herramientas"
                    collapsed: true
                    subItems: [
                        ListElement { itemName: "Agenda" },
                        ListElement { itemName: "Estadisticas" ;separate:true},
                        ListElement { itemName: "Calculadora medica" ;separate:true},
                        ListElement { itemName: "Referencia de enfermedades" ;separate:true},
                        ListElement { itemName: "Asistente de recetas" ;separate:true},
                        ListElement { itemName: "Asistente orden de analisis" }
                    ]
                }
                ListElement {
                    categoryName: "Configuracion"
                    collapsed: true
                    subItems: [
                        ListElement { itemName: "Medicamento" },
                        ListElement { itemName: "Imprimir receta";separate:true },
                        ListElement { itemName: "Imprimir orden de analisis" }
                    ]
                }
                ListElement {
                    categoryName: "Historial"
                    collapsed: true
                    subItems: [
                        ListElement { itemName: "Consultar historial del paciente" }
                    ]
                }
                ListElement {
                    categoryName: "Ayuda"
                    collapsed: true
                    subItems: [
                        ListElement { itemName: "Consultar manual de ayuda" }
                    ]
                }
                ListElement {
                    categoryName: "Pacientes"
                    collapsed: true
                    subItems: [
                        ListElement { itemName: "Mensajes" },
                        ListElement { itemName: "Listado de pacientes" ;separate:true}
                    ]
                }
            }//<-- termina la BarraLateral ---->

            Component {
                id: categoryDelegate
                Column {
                    width: parent.width
                    Rectangle {
                        id: categoryItem
                        color: "#ffffff"
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
                                menuPrincipal.currentIndex = index
                                if(index == 0){
                                    expediente.visible = true
                                    loaderContenedorGeneral.source = ""
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
                            source: {
                                if(categoryName == 'Archivo')
                                {
                                    "qrc:/imagenes/images/file.png"
                                }else if(categoryName == 'Configuracion'){
                                    "qrc:/imagenes/images/settings.png"
                                }else if(categoryName == 'Herramientas'){
                                    "qrc:/imagenes/images/tools.png"
                                }else if(categoryName == 'Ayuda'){
                                    "qrc:/imagenes/images/help.png"
                                }else if(categoryName == 'Historial'){
                                    "qrc:/imagenes/images/history.png"
                                }else if(categoryName == 'Pacientes'){
                                    "qrc:/imagenes/images/messenger.png"
                                }

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
                            color: "#f1f1f1"
                            height: 40
                            width: 250
                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                x: 30
                                font.pixelSize: 14
                                text: itemName
                            }
                            MouseArea {
                                anchors.fill: parent
                                hoverEnabled: true
                                onClicked:{
        /////////////////////// ACCIONES EN EVENTO CLICK ////////////////////

                                    //menu_screen.x = 80
                                    menu_screen.x = -177
                                    click_button.x = 90

                                    menuPrincipal.currentIndex = index

                                    ///////saca el nombre del indice que se selecciona///////|
                                    seccion = subItemRepeater.model.get(menuPrincipal.currentIndex).itemName
                                    console.log(seccion)
                                    if(seccion == "Medicamento"){
                                        medicamento.visible = true
                                    }else if(seccion == "Abrir base"){
                                           abrirBase.visible = true
                                    }else if (seccion == "Recuperar respaldo"){
                                           recuperarBase.visible = true
                                    }else if(seccion == "Guardar estado actual"){
                                           guardarEstado.visible = true
                                    }else if(seccion == "Crear respaldo"){
                                            crearRespaldo.visible = true
                                    }else if(seccion == "Agenda"){
                                        agenda.visible = true
                                    }else if(seccion == "Referencia de enfermedades"){
                                        listaEnfermedades.visible =true
                                    }else if(seccion == "Calculadora medica"){
                                        calculadora.visible = true
                                    }else if(seccion == 'Estadisticas'){
                                        estadisticas.visible = true
                                    }else if(seccion =="Asistente de recetas"){
                                        asistenteRecetas.visible = true
                                    }else if(seccion == "Asistente orden de analisis"){
                                        listaEstudios.visible = true
                                   }else if(seccion == "Mensajes"){


                                        ///////////////////////////////
                                        expediente.visible = false

                                        loaderContenedorGeneral.source = "qrc:/componentesLaterales/ChatPacientes.qml"
                                    }else if(seccion == "Consultar historial del paciente"){
                                        historialPaciente.visible = true
                                    }else if(seccion == "Listado de pacientes"){


                                        ///////////////////////////////
                                        expediente.visible = false


                                        loaderContenedorGeneral.source ="qrc:/componentesLaterales/ListaDePacientes.qml"
                                    }else if(seccion =="Consultar manual de ayuda"){
                                        manual.visible = true
                                    }



        ///////////////////////////FIN DE ACCIONES EN EVENTO CLICK ////////////
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

        ////////////////////////////////////////////|
        ///// BOTON QUE ABRE LA BARRA //////////////|
        ////////////////////////////////////////////|
        Rectangle
        {
            id: click_button
            width: 40; height: 40
            scale: m_area.pressed ? 1.1 : 1
            color:"transparent"
            //color: "white"

            ////////////////////////////////////////|
            //// Para debuggear la posicion de la //|
            //// barra que hace el despliegue///////|
            ////////////////////////////////////////|

            radius: 5
            x: 90; y: 10;
            z:5
            Behavior on x { NumberAnimation { } }
        }
        MouseArea
        {
            id: m_area
            z: 5

            anchors.fill: click_button
            onClicked :
            {
                click_button.x = click_button.x == 90 ? 290 : 90
                menu_screen.x = menu_screen.x == 80 ? -187 : 80

                ////////////////////////////////////////////////////|
                ///// Desplaza el boton que abre la barra a la misma|
                ///// posicion que la BarraLateral /////////////////|
            }

            Image {
                id: hamburger
                x: 10
                y: 8
                width: 40
                height: 40
                anchors.fill: parent
                transformOrigin: Item.Center
                source: "qrc:/img/img/hamburger.png"
            }
        }
        ////////////////////////////////////////////|
        /////TERMINA LA BARRA LATERAL //////////////|
        ////////////////////////////////////////////|
    }//<---Termina el contenedor row----->


    Flow {
        id: contenedorSuperior
        height: 80
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        FlatTopNavBar{
            id: barraContenedorBusqueda
            anchors.left: parent.left
            anchors.right: parent.right
            FlatInput {
                id: consul
                anchors.right: parent.right
                anchors.rightMargin: 172
                anchors.top: parent.top
                anchors.topMargin: 8
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.left: parent.left
                anchors.leftMargin:hamburger.width+20
                placeholderText: "Ingresa el nombre del paciente"
                onAccepted: {
                    model.clear()
                    Tablas12.consultarList('EXPEDIENTE_PACIENTE',model,consul.text)
                    lista.visible = true
                }
            }
        }
    }
//inicia la ventana que muestra la lista de los pacientes registrados//
    Window
    {
        id:lista
        width: 400
        height: 400
        ListView
        {
            id:lista_contactos
            anchors.fill: parent
            model: model
            delegate: categoryDelegat
            highlight: Rectangle
            {
            color: "lightsteelblue"; radius: 5
        }
        }

        ListModel
        {
            id: model
            ListElement
            {
                fotoPa:""
                name:""
                apellido:""
                apellidoMa:""
                rfcPa:""
                curpPa:""
                religionPa:""
                referenciadoPa: ""
                ocupacionPa:""
                estado_civilPa:""
                edadPa:1
                estaturaPa:1
                pesoPa:1
                telParticularPa:1
                telOficinaPa:1
                celularPa:1
                ciudadPa:""
                cpPa: 1
                emailPa:""
                estadoRegionPa: ""
                coloniaPa: ""
                calleNumeroPa: ""
                paisPa:""
                fechaPa:""
                sexoPa:""

                //seguro_Medico//
                institucion_aseguradoraPa:""
                numero_seguroPa:1
                nombrePa:""
                fecha_expedicionPa:1
                fecha_expiracionPa:1
                nombre_familiar1Pa:""
                nombre_familiar2Pa:""
                telefono1Pa:1
                telefono2Pa:1
                observaPa:""
                //finaliza seguro_medico//

            }
        }

        Component {
            id: categoryDelegat
            Row {
                width: parent.width
                Rectangle {
                    id: categoryItem
                    color: "#f1f1f1"; radius: 5
                    height: 50
                    width: parent.width
                    Text {
                        x: 15
                        font.pixelSize: 18
                        text: name + " " + apellido + " " + apellidoMa
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
                        onClicked:
                        {
                            lista_contactos.currentIndex = index

                        }
                    }
                focus:true
                clip: true
                }
            }
        }
    }
//finaliza la ventana de la consulta de los pacientes//

    FlatDropdown {
        id: flatDropdown1
        y:8
        color: "#ffffff"
        text:"Perfil"
        highlightColor: "#ffffff"
        pressColor: "#16a085"
        padding: 90
        dropdownColor: "#ecf0f1"
        dropdownHeight: 45
        dropdownItemHeight:50
        dropdownWidth: 150
        anchors.leftMargin: barraContenedorBusqueda.width-150
        anchors.left: parent.left
        model: ListModel
        {
        ListElement {item: "Cerrar sesion";}
        ListElement {item: "Configuracion "; separator: true}
    }

    Item {
        width: 40
        height: 40
        Image {
            id: perfil
            source: "qrc:/img/img/perfil.png"
            sourceSize: Qt.size(parent.width, parent.height)
            //smooth: true
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
///////////////////////// INICIO COMPONENTES EXTRAS ////////////////|
FileDialog{
    id:abrirBase
    nameFilters: [ "DB files (*.db)", "All files (*)" ]
    onAccepted: {
        console.log("You chose: " + abrirBase.fileUrls)
    }
}

FileDialog{
    id:recuperarBase
    nameFilters: [ "DB files (*.db)", "All files (*)" ]
    onAccepted: {
        console.log("You chose: " + recuperarBase.fileUrls)
    }

}


Dialog {
    id:guardarEstado
    title: "Estado actual guardado"
    contentItem: Rectangle {
        color: "#fff"
        implicitWidth: 200
        implicitHeight: 80
        Text {
            text: "Estado guardado!"
            color: "#000"
            anchors.centerIn: parent
        }
        Button{
            width: 80
            height: 25
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 3
            anchors.rightMargin: 10
            text: "Aceptar"
            onClicked: guardarEstado.close()

        }
    }

}


Dialog {
    id:crearRespaldo
    title: "Creando respaldo"
    standardButtons: StandardButton.Ok | StandardButton.Canel
    contentItem: Rectangle {
        color: "#fff"
        implicitWidth: 400
        implicitHeight: 80
        Text {
            text: "Respaldo creado en la direccion /tmp/respaldo02052016.db!"
            color: "#000"
            anchors.centerIn: parent
        }
        Button{
            width: 80
            height: 25
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 3
            anchors.rightMargin: 10
            text: "Aceptar"
            onClicked:  crearRespaldo.close()
        }
    }

}


///////////////////////// FIN COMPONENTES EXTRAS ////////////////////|



}
