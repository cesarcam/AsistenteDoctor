import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtQml.Models 2.2
import "../modelo/Modelo.js" as DB
import "../modelo/CreacionTablasBase.js" as Tablas1
import QtQuick.LocalStorage 2.0

Item {
    Component.onCompleted: {
        Tablas1.crear()
    }
    property var consulta: new Array()
    property variant arrDatos:  new Array()
    property var eliminar: new Array()

    id: contenedorDatosGenerales
    anchors.fill: parent
    //property string loadUrl: "file:///C:/Users/Ces/Pictures/DoctorFlat/img/perfil.png"
    property string loadUrl: "file:///home/cesar/Descargas/DoctorFlat/img/perfil.png"
    property string saveUrl: ""
    Flow {
        id: contendorDatosPersonales
        height: 130
        anchors.top: parent.top
        anchors.topMargin: 10
        spacing: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: contenedorImagen.right
        anchors.leftMargin: 10
        FlatInput {
            id: nombre
            width: parent.width
            height: 35
            placeholderText: "Ingresa nombre(s) "
            validator: RegExpValidator{regExp: /^[a-zA-Z\s]{2,30}$/}
        }
        FlatInput {
            id: apellido_paterno
            width: parent.width
            height: 35
            placeholderText: "Ingresa apellido paterno "
            validator: RegExpValidator{regExp: /^[a-zA-Z]{3,20}$/}
        }
        FlatInput {
            id: apellido_materno
            width: parent.width
            height: 35
            placeholderText: qsTr("Ingresa apellido materno")
            validator: RegExpValidator{regExp: /^[a-zA-Z]{3,20}$/}
        }
    }
    FileDialog{
        id:subirFoto
        onAccepted: {
            console.log("You chose: " + subirFoto.fileUrls)
        }
    }

    Dialog
    {
        id: dateDialog
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            fechaNacimiento.text = calendar.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: calendar
            visibleYear: 1990
            onDoubleClicked: dateDialog.click(StandardButton.Save)
        }
    }

    Grid {
        id: contenedorImagen
        width: 130
        height: 140
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10

        Image {
            id: source
            width: 130
            height: 130
            source: loadUrl
        }

        ///Inicia la funcion para guardar la imagen///

//        Button{
//            text: "Guardar Imagen"
//            anchors.bottom: source.bottom
//            anchors.right: source.right
//            anchors.left: source.left
//            visible: true
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    source.grabToImage(function(result)
                    {
                        //saveUrl = "C:/Users/Ces/Pictures/DoctorFlat/img/"+Math.ceil(Math.random() * 100000)+"[Nombre].png";
                        saveUrl = "home/android-fgbt18991/Descargas/DoctorFlat/img/"+Math.ceil(Math.random() * 100000)+"[Nombre].png";
                        result.saveToFile(saveUrl);
                    },Qt.size(200,200));
                }
            }
        //}
        ///finaliza la funcion para guardar la imagen///

        ///Inicia Funcion para cargar la Imagen///
        Canvas {
            id: root
            anchors.fill: parent
            antialiasing: true
            transformOrigin: Item.TopLeft

            onPaint: {
                var ctx = getContext( "2d" );
                ctx.drawImage(image, 0,0)
            }
        }

        MouseArea {
            x: 50
            y: 0
            anchors.bottomMargin: 50
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 0
            onClicked: {
                fileDialog.visible = true
            }
        }

        FileDialog{
            id: fileDialog
            title: "Please choose a file"
            onAccepted: {
                loadUrl = fileDialog.fileUrl;
                console.log("Imagen seleccionada: " + fileDialog.fileUrls)
            }
            onRejected: {
                console.log("Imagen Guardada" + fileDialog.fileUrls)
            }
        }
    }

    Row {
        id: row1
        width: 640
        height: 40
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.top: contendorDatosPersonales.bottom
        anchors.topMargin: 10
        spacing: 5

        FlatInput {
            id: rfc
            height: 35
            anchors.leftMargin: 10
            anchors.left: parent.left
            anchors.right: curp.left
            anchors.rightMargin: 10
            placeholderText: "R.F.C"
            validator: RegExpValidator{regExp: /^[a-zA-Z]{3,4}(\d{6})((\D|\d){3})?$/}
        }

        FlatInput {
            id: curp
            width: (parent.width/7)
            height: 35
            anchors.right: fechaNacimiento.left
            anchors.rightMargin: 10
            placeholderText: "CURP"
            validator: RegExpValidator{regExp: /^[A-Z0-9]{18}$/}
        }
        FlatInput {
            id: fechaNacimiento
            width: (parent.width/7)
            height: 35
            anchors.right: edad.left
            anchors.rightMargin: 10
            placeholderText: "Ingresa la fecha"
            MouseArea{
                id: mouseArea1
                visible: true
                anchors.fill: parent
                onClicked: {
                    dateDialog.visible = true
                }
            }
        }

        FlatInput {
            id: edad
            width: (parent.width/9)
            height: 35
            anchors.right: estatura.left
            anchors.rightMargin: 10
            placeholderText: "Edad"
            validator: RegExpValidator{regExp: /^[0-9]{1,2}$/}
        }

        FlatInput {
            id: estatura
            width: (parent.width/7)
            height: 35
            anchors.right: peso.left
            anchors.rightMargin: 10
            placeholderText: "Estatura(mts)"
            validator: RegExpValidator{regExp: /^[0-9]{1,3}[.][0-9]{1,3}$/}
        }

        FlatInput {
            id: peso
            width: (parent.width/9)
            height: 35
            anchors.right: sexo.left
            anchors.rightMargin: 10
            placeholderText: "Peso"
            validator: RegExpValidator{regExp: /^[0-9]{1,3}[.][0-9]{1,3}$/}
        }

        ComboBox
        {
            editable: true
            id: sexo
            y: -1
            width: (parent.width/7)
            height: 35
            //radius : 0
            anchors.right: parent.right
            focus : true
            model: ListModel
            {
            id:sex
            ListElement{text: "Sexo";}
            ListElement{text: "Masculino";}
            ListElement{text: "Femenino"; separator : true}
        }
        }
}

Row {
    id: row2
    x: 0
    y: -9
    width: 640
    height: 40
    anchors.top: row1.bottom
    anchors.topMargin: 10
    anchors.rightMargin: 10
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.leftMargin: 0

    FlatInput {
        id: religionPaciente
        height: 35
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: ocupacion.left
        anchors.rightMargin: 10
        placeholderText: "Religion"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
    }

    FlatInput {
        id: ocupacion
        width: parent.width/4
        height: 35
        anchors.right: estadoCivil.left
        anchors.rightMargin: 10
        placeholderText : "Ocupacion"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
    }

    FlatInput {
        id: estadoCivil
        width: parent.width/4
        height: 35
        anchors.right: referenciado.left
        anchors.rightMargin: 10
        placeholderText : "Estado civil"
        validator: RegExpValidator{regExp: /^[a-zA-Z]{3,30}$/}
    }

    FlatInput {
        id: referenciado
        width: parent.width/4
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Referenciado"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
    }
}

Row {
    id: row3
    x: 2
    y: -12
    width: 640
    height: 40
    anchors.top: row2.bottom
    anchors.topMargin: 10
    anchors.rightMargin: 10
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.leftMargin: 0

    FlatInput {
        id: telParticular
        height: 35
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: telOficina.left
        anchors.rightMargin: 10
        placeholderText: "Tel. particular"
        validator: RegExpValidator{regExp: /^[0-9]{10}$/}
    }

    FlatInput {
        id: telOficina
        width: parent.width/4
        height: 35
        anchors.right: celular.left
        anchors.rightMargin: 10
        placeholderText: "Tel. Oficina/Fax"
        validator: RegExpValidator{regExp: /^[0-9]{10}$/}
    }

    FlatInput {
        id: celular
        width: parent.width/4
        height: 35
        anchors.right: email.left
        anchors.rightMargin: 10
        placeholderText: "Celular"
        validator: RegExpValidator{regExp: /^[0-9]{10}$/}
    }

    FlatInput {
        id: email
        width: parent.width/4
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Email "
        validator: RegExpValidator{regExp: /^[a-zA-Z0-9_\-\.~]{2,}@[a-zA-Z0-9_\-\.~]{2,}\.[a-zA-Z]{2,4}$/}
    }
}

Row {
    id: row4
    x: 0
    y: 0
    width: 640
    height: 40
    anchors.top: row3.bottom
    anchors.topMargin: 10
    anchors.rightMargin: 10
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.leftMargin: 0

    FlatInput {
        id: calleNumero
        height: 35
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: colonia.left
        anchors.rightMargin: 10
        placeholderText: "Calle y número"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}[0-9]{1,3}$/}
    }

    FlatInput {
        id: colonia
        width: parent.width/3
        height: 35
        anchors.right: ciudad.left
        anchors.rightMargin: 10
        placeholderText: "Colonia"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
    }

    FlatInput {
        id: ciudad
        width: parent.width/3
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Ciudad"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
    }
}

Row {
    id: row5
    x: 0
    y: 0
    width: 640
    height: 40
    anchors.top: row4.bottom
    anchors.topMargin: 10
    anchors.rightMargin: 10
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.leftMargin: 0

    FlatInput {
        id: estadoRegion
        height: 35
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: codigoPostal.left
        anchors.rightMargin: 10
        placeholderText: "Estado/Region"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
    }

    FlatInput {
        id: codigoPostal
        x: 150
        width: parent.width/3
        height: 35
        anchors.right: nacionalidad.left
        anchors.rightMargin: 10
        placeholderText: "Codigo Postal"
        validator: RegExpValidator{regExp: /\b[0-9]{5}\b$/}
    }

    FlatInput {
        id: nacionalidad
        x: 350
        width: parent.width/3
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Nacionalidad"
        validator: RegExpValidator{regExp: /^[a-zA-Z\s]{3,30}$/}
    }
}

////Inicia la funcion para la insercion de datos////
Button {
    id: guardarDatosInsertados
    x: 540
    y: 396
    text: qsTr("guardar")
    onClicked:
    {
        //arrDatos["foto"]= source.text;
        arrDatos["3"]= 'apellido_paterno,'+ apellido_paterno.text;
        arrDatos["4"]= 'apellido_materno,'+ apellido_materno.text;
        arrDatos["5"]= 'nombre,'+ nombre.text
        arrDatos["6"]= 'rfc,'+rfc.text;
        arrDatos["7"]= 'curp,'+ curp.text;
        arrDatos["8"]= 'fechaNacimiento,'+ fechaNacimiento.text;
        arrDatos["9"]= 'edad,'+ parseInt(edad.text)
        arrDatos["10"]='estatura,'+ parseFloat(estatura.text)
        arrDatos["11"]='peso,'+ parseFloat(peso.text);
        arrDatos["12"]='sexo,'+ sex.get(sexo.currentIndex).text;
        arrDatos["13"]='religion,'+ religionPaciente.text;
        arrDatos["14"]='ocupacion,'+ ocupacion.text;
        arrDatos["15"]='estado_civil,'+ estadoCivil.text;
        arrDatos["16"]='referenciado,'+ referenciado.text;
        arrDatos["17"]='telefono_particular,'+ parseInt(telParticular.text);
        arrDatos["18"]='telefono_oficina,'+ parseInt(telOficina.text);
        arrDatos["19"]='celular,'+ parseInt(celular.text);
        arrDatos["20"]='email,'+ email.text;
        arrDatos["21"]='calle_y_numero,'+ calleNumero.text;
        arrDatos["22"]='colonia,'+ colonia.text;
        arrDatos["23"]='ciudad,'+ ciudad.text
        arrDatos["24"]='estado,'+ estadoRegion.text;
        arrDatos["25"]='cp,'+ parseInt(codigoPostal.text);
        arrDatos["26"]='pais,'+nacionalidad.text;
        DB.insertar('EXPEDIENTE_PACIENTE',arrDatos)
    }
}
///Finaliza la insercion para la base de datos///

///inicia la funcion para eliminar el registro de un paciente///
Button
{
    id:btnBorrar
    y:396
    x:220
    text: "eliminar"
    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            DB.borrar(nombre.text)
            model.clear()
            DB.consultar(model)
        }
    }
}
///finaliza la funcion para eliminar el registro de un paciente///

Button
{
    id: btnMostrar
    y: 396
    x: 350
    text: "Datos del paciente"

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

//            foto1 = lista_contactos.model.get(lista_contactos.currentIndex).fotoPa
//            source.text = foto1

            nombre123 = lista_contactos.model.get(lista_contactos.currentIndex).name
            nombre.text = nombre123

            apellido123 = lista_contactos.model.get(lista_contactos.currentIndex).apellido
            apellido_paterno.text = apellido123

            apellido12 = lista_contactos.model.get(lista_contactos.currentIndex).apellidoMa
            apellido_materno.text = apellido12

            rfc1 = lista_contactos.model.get(lista_contactos.currentIndex).rfcPa
            rfc.text = rfc1

            curp1 = lista_contactos.model.get(lista_contactos.currentIndex).curpPa
            curp.text = curp1

            ocupacion1 = lista_contactos.model.get(lista_contactos.currentIndex).ocupacionPa
            ocupacion.text = ocupacion1

            estadocivil1 = lista_contactos.model.get(lista_contactos.currentIndex).estado_civilPa
            estadoCivil.text = estadocivil1

            edad1 = lista_contactos.model.get(lista_contactos.currentIndex).edadPa
            edad.text = edad1

            estatura1 = lista_contactos.model.get(lista_contactos.currentIndex).estaturaPa
            estatura.text = estatura1

            peso1 = lista_contactos.model.get(lista_contactos.currentIndex).pesoPa
            peso.text = peso1

            telefonoParticula1 = lista_contactos.model.get(lista_contactos.currentIndex).telParticularPa
            telParticular.text = telefonoParticula1

            telefonoOficina1 = lista_contactos.model.get(lista_contactos.currentIndex).telOficinaPa
            telOficina.text = telefonoOficina1

            celular1 = lista_contactos.model.get(lista_contactos.currentIndex).celularPa
            celular.text = celular1

            referenciado1 = lista_contactos.model.get(lista_contactos.currentIndex).referenciadoPa
            referenciado.text = referenciado1

            religion1 = lista_contactos.model.get(lista_contactos.currentIndex).religionPa
            religionPaciente.text = religion1

            email1 = lista_contactos.model.get(lista_contactos.currentIndex).emailPa
            email.text = email1

            calleNumero1 = lista_contactos.model.get(lista_contactos.currentIndex).calleNumeroPa
            calleNumero.text = calleNumero1

            colonia1 = lista_contactos.model.get(lista_contactos.currentIndex).coloniaPa
            colonia.text = colonia1

            estadoRegion1 = lista_contactos.model.get(lista_contactos.currentIndex).estadoRegionPa
            estadoRegion.text = estadoRegion1

            codigoPostal1 = lista_contactos.model.get(lista_contactos.currentIndex).cpPa
            codigoPostal.text = codigoPostal1

            pais1 = lista_contactos.model.get(lista_contactos.currentIndex).paisPa
            nacionalidad.text = pais1

            ciudad1 = lista_contactos.model.get(lista_contactos.currentIndex).ciudadPa
            ciudad.text = ciudad1

            fechaNacimiento1 = lista_contactos.model.get(lista_contactos.currentIndex).fechaPa
            fechaNacimiento.text = fechaNacimiento1

            sexo1 = lista_contactos.model.get(lista_contactos.currentIndex).sexoPa
            sexo.currentIndex = sexo.find(sexo1)

//            id_paciente1 = lista_contactos.model.get(lista_contactos.currentIndex).idPaciente
//            SeguroMedico = id_paciente1(consultar)

            console.log(categoryDelegat.currentIndex);//indicara el index 2 y 3
        }
    }
}

}
