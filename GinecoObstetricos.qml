import "../flatui"
import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
Item {
    id: ginecologia
    height: 600
    property alias fechaUltimo: fechaUltimo
    Grid {
        id: grid1
        width: 246
        height: 120
        anchors.top: parent.top
        anchors.topMargin: 10
        FlatInput {
            id: flatIconInput2
            height: 35
            placeholderText: "Ciclo Menstrual [DIAS]"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            validator: RegExpValidator {regExp: /^[0-9]{1,2}$/}
        }
        FlatInput {
            id: menarquia
            height: 35
            anchors.bottom: flatIconInput2.top
            anchors.bottomMargin: 20
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.rightMargin: 0
            placeholderText: "Menarquia"
            MouseArea{
                id: mouseA1
                anchors.fill: menarquia
                onClicked: {
                    menarquiaDialogo.visible = true
                }
            }
        }
    }
    Column {
        id: column1
        width: 95
        height: 120
        spacing: 20
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: grid1.right
        anchors.leftMargin: 5
        FlatRadioButton {
            id: flatRadioButton1
            text: "Abundante"
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        FlatRadioButton {
            id: flatRadioButton2
            text: "Regular"
            anchors.horizontalCenter: parent.horizontalCenter
        }
        FlatRadioButton {
            id: flatRadioButton3
            text: "Escaso"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Grid {
        id: grid2
        height: 120
        anchors.left: column1.right
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        FlatBoxSwitch {
            id: flatBoxSwitch1
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            onText: "SI"
            offText: "NO"
        }

        FlatInput {
            id: relacionFecha
            width: 150
            height: 35
            anchors.left: parent.left
            anchors.leftMargin: 121
            placeholderText: "Fecha 1er Relacion"
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.rightMargin: 10
            MouseArea{
                id: mouseArea1
                anchors.fill: relacionFecha
                onClicked: {
                    relacion.visible = true
                }
            }
        }

        FlatInput {
            id: flatIconInput4
            width: 150
            height: 35
            anchors.left: parent.left
            anchors.leftMargin: 120
            placeholderText: "No de personas"
            anchors.top: relacionFecha.bottom
            anchors.topMargin: 20
            anchors.rightMargin: 10
            validator: RegExpValidator {regExp: /^[0-9]{1,2}$/}
        }
    }

    TextArea {
        id: textArea1
        width: 680
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: abdominales.bottom
        anchors.topMargin: 30
    }

    FlatSuccessButton {
        id: guardarGinecologia
        x: 457
        text: "Guardar"
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
        anchors.top: textArea1.bottom
        anchors.topMargin: 6
    }
    FlatInput {
        id: flatIconInput1
        y: 170
        width: 300
        height: 35
        anchors.left: flatCheckBox2.right
        anchors.leftMargin: 90
        placeholderText: "Numero"
        validator: RegExpValidator {regExp: /^[0-9]{1,2}$/}
    }

    FlatCheckBox {
        id: flatCheckBox2
        x: 117
        y: 177
        text: "Abortos"
        anchors.leftMargin: 20
        anchors.left: flatCheckBox1.right

    }

    FlatCheckBox {
        id: flatCheckBox1
        x: 30
        y: 177
        text: "Gestas"
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    FlatInput {
        id: abdominales
        x: 515
        y: 295
        width: 130
        height: 30
        placeholderText: "Abdominales"
        anchors.leftMargin: 10
        anchors.left: eutocicos.right
        validator: RegExpValidator{regExp: /^[a-zA-Z]{1,20}$/}
    }

    FlatInput {
        id: eutocicos
        x: 375
        y: 253
        width: 130
        height: 30
        placeholderText: "Eutocicos"
        anchors.leftMargin: 6
        anchors.left: partos.right
        validator: RegExpValidator{regExp:/^[0-9]{1,2}$/}
    }

    FlatInput {
        id: partos
        x: 235
        y: 253
        width: 130
        height: 30
        placeholderText: "partos"
        anchors.leftMargin: 10
        anchors.left: fechaEmbarazo.right
       validator: RegExpValidator{regExp:/^[0-9]{1,2}$/}
    }

    FlatInput {
        id: fechaEmbarazo
        x: 10
        y: 253
        height: 30
        placeholderText: "Fecha 1er Embarazo"
        anchors.left: parent.left
        anchors.leftMargin: 10
        MouseArea{
            id: mouserEmbarazo
            anchors.fill: parent
            onClicked: {
                embarazo.visible = true
            }
        }
    }

    Dialog
    {
        id: relacion
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            relacionFecha .text = relacionCal.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: relacionCal
            x: 0
            y: 0
            onDoubleClicked: relacion.click(StandardButton.Save)
        }
    }
    Dialog
    {
        id: embarazo
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            fechaEmbarazo .text = embarazoCal.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: embarazoCal
            x: 0
            y: 0
            onDoubleClicked: dateDialog.click(StandardButton.Save)
        }
    }

    Dialog
    {
        id: ultima
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            fechaUltimo .text = ultimaCal.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: ultimaCal
            x: 0
            y: 0
            onDoubleClicked: dateDialog.click(StandardButton.Save)
        }
    }

    Dialog
    {
        id: menarquiaDialogo
        title: "Selecciona la fecha"
        standardButtons: StandardButton.Save | StandardButton.Cancel
        height: 200
        width: 280
        onAccepted:{
            menarquia .text = menarquiaFecha.selectedDate.toLocaleDateString()
        }
        Calendar {
            id: menarquiaFecha
            x: 0
            y: 0
            onDoubleClicked: dateDialog.click(StandardButton.Save)
        }
    }
    FlatInput {
        id: fechaUltimo
        x: 19
        y: 295
        height: 30
        placeholderText: "Fecha ultimo embarazo"
        anchors.leftMargin: 10
        anchors.left: parent.left
        MouseArea{
            id: mouseUltimo
            anchors.fill: fechaUltimo
            onClicked: {
                ultima.visible = true
            }
        }
    }

    FlatInput {
        id: prematuros
        x: 244
        y: 295
        width: 130
        height: 30
        placeholderText: "prematuros"
        anchors.leftMargin: 10
        anchors.left: fechaEmbarazo.right
        validator: RegExpValidator{regExp: /^[a-zA-Z]{1,20}$/}
    }

    FlatInput {
        id: distocicos
        x: 384
        y: 295
        width: 130
        height: 30
        placeholderText: "Distocicos"
        anchors.leftMargin: 10
        anchors.left: partos.right
        validator: RegExpValidator{regExp: /^[a-zA-Z]{1,20}$/}
    }

    FlatInput {
        id: vaginales
        x: 524
        y: 253
        width: 130
        height: 30
        placeholderText: "Vaginales"
        anchors.leftMargin: 10
        anchors.left: eutocicos.right
        validator: RegExpValidator{regExp: /^[a-zA-Z]{1,20}$/}
    }

    Text {
        id: text1
        x: 362
        y: 29
        text: qsTr("Actividad Sexual")
        font.pixelSize: 12
    }

    Text {
        id: text2
        x: 20
        y: 334
        text: qsTr("Complicaciones")
        font.pixelSize: 12
    }

}
