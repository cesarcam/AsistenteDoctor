import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

Item {
    id: contenedorDatosGenerales
    anchors.fill: parent
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
            id: nombres
            width: parent.width
            height: 35
            placeholderText: qsTr("Ingresa nombre(s)")
        }
        FlatInput {
            id: apPaterno
            width: parent.width
            height: 35
            placeholderText: qsTr("Ingresa apellido paterno")
        }
        FlatInput {
            id: apMaterno
            width: parent.width
            height: 35
            placeholderText: qsTr("Ingresa apellido materno")
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

        FlatImage {
            id: image1
            width: 100
            height: 120
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/img/img/perfil.png"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    subirFoto.visible =true

                }
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
        }

        FlatInput {
            id: curp
            width: (parent.width/7)
            height: 35
            anchors.right: fechaNacimiento.left
            anchors.rightMargin: 10
            placeholderText: "CURP"
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
        }

        FlatInput {
            id: estatura
            width: (parent.width/7)
            height: 35
            anchors.right: peso.left
            anchors.rightMargin: 10
            placeholderText: "Estatura(mts)"
        }

        FlatInput {
            id: peso
            width: (parent.width/9)
            height: 35
            anchors.right: sexo.left
            anchors.rightMargin: 10
            placeholderText: "Peso"
        }

        FlatDropdown {
            id: sexo
            y: -1
            width: (parent.width/7)
            height: 35
            radius: 0
            color: "#70A9E3"
            text:"Sexo"
            anchors.right: parent.right
            pressColor: "#4546c2"
            textCheckedColor: "#123"
            dropdownTextColor: "#000000"
            highlightColor: "#70A9E3"
            dropdownColor: "#70A9E3"
            dropdownHeight:45
            dropdownItemHeight:50
            dropdownWidth: 150
            model: ListModel
            {
            ListElement {item: "Masculino";}
            ListElement {item: "Femenino"; separator: true}
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
        id: religion
        height: 35
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: ocupacion.left
        anchors.rightMargin: 10
        placeholderText: "Religion"
    }

    FlatInput {
        id: ocupacion
        width: parent.width/4
        height: 35
        anchors.right: estadoCivil.left
        anchors.rightMargin: 10
        placeholderText: "Ocupacion/Puesto"
    }

    FlatInput {
        id: estadoCivil
        width: parent.width/4
        height: 35
        anchors.right: referenciado.left
        anchors.rightMargin: 10
        placeholderText: "Estado civil"
    }

    FlatInput {
        id: referenciado
        width: parent.width/4
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Referenciado"
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
    }

    FlatInput {
        id: telOficina
        width: parent.width/4
        height: 35
        anchors.right: celular.left
        anchors.rightMargin: 10
        placeholderText: "Tel. Oficina/Fax"
    }

    FlatInput {
        id: celular
        width: parent.width/4
        height: 35
        anchors.right: email.left
        anchors.rightMargin: 10
        placeholderText: "Celular "
    }

    FlatInput {
        id: email
        width: parent.width/4
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Email "
    }
}

Row {
    id: row4

    x: -3
    y: -4
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
    }

    FlatInput {
        id: colonia
        width: parent.width/3
        height: 35
        anchors.right: ciudad.left
        anchors.rightMargin: 10
        placeholderText: "Colonia"
    }

    FlatInput {
        id: ciudad
        width: parent.width/3
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Ciudad"
    }
}

Row {
    id: row5
    x: -7
    y: -9
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
    }

    FlatInput {
        id: codigoPostal
        x: 150
        width: parent.width/3
        height: 35
        anchors.right: pais.left
        anchors.rightMargin: 10
        placeholderText: "Codigo Postal"
    }

    FlatInput {
        id: pais
        x: 350
        width: parent.width/3
        height: 35
        anchors.right: parent.right
        anchors.rightMargin: 0
        placeholderText: "Pais"
    }
}








}
