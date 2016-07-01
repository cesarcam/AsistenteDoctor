import "../flatui"
import QtQuick 2.0

Item {
    id: item1
    Row {
        id: row1
        width: 700
        height: 66
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 8

        FlatInput {
            id: temperatura
            height: 35
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: item1.top
            anchors.bottomMargin: -47
            anchors.top: parent.top
            anchors.topMargin: 20
            placeholderText: "Temperatura"
            validator: RegExpValidator{regExp: /^[0-9a-z\s]{5,30}$/}
        }

        FlatInput {
            id: pulso
            width: 150
            height: 35
            opacity: 1.1
            anchors.left: temperatura.right
            placeholderText: "Pulso"
            anchors.topMargin: 20
            anchors.leftMargin: 10
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9a-z\s]{5,30}$/}
        }

        FlatInput {
            id: tensionArterial
            width: 150
            height: 35
            anchors.left: pulso.right
            placeholderText: "Tension Arterial"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9a-z\s]{5,30}$/}
        }

        FlatInput {
            id: frecuenciaCardiaca
            height: 35
            anchors.left: tensionArterial.right
            placeholderText: "Fecruencia cardiaca"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9a-z\s]{5,30}$/}
        }
    }

    Row {
        id: row2
        x: 4
        y: 3
        width: 700
        height: 66
        spacing: 6
        FlatInput {
            id: frecuenciaRespiratoria
            width: 218
            height: 35
            anchors.left: parent.left
            placeholderText: "Frecuencia cardiaca"
            anchors.topMargin: 20
            anchors.leftMargin: 10
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9a-z\s]{5,30}$/}
        }

        FlatInput {
            id: estatura
            width: 150
            height: 34.9
            verticalAlignment: 128
            horizontalAlignment: 1
            echoMode: -8
            opacity: 1
            anchors.left: frecuenciaRespiratoria.right
            placeholderText: "Estatura(mts)"
            anchors.topMargin: 20
            anchors.leftMargin: 10
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9]{1,3}[.][0-9]{1,3}$/}
        }

        FlatInput {
            id: pesoIdeal
            width: 150
            height: 35
            anchors.left: estatura.right
            placeholderText: "Peso ideal"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9]{1,3}[.][0-9]{1,3}$/}
        }

        FlatInput {
            id: imc
            height: 35
            anchors.left: pesoIdeal.right
            placeholderText: "IMC"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9]{1,3}[.][0-9]{1,3}$/}
        }
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 8
        anchors.top: row1.bottom
    }

    Row {
        id: row3
        x: 11
        y: -6
        width: 700
        height: 66
        FlatInput {
            id: frecuenciaRespiratoria1
            width: 218
            height: 35
            anchors.left: parent.left
            placeholderText: "Frecuencia cardiaca"
            anchors.topMargin: 20
            anchors.leftMargin: 10
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9]{1,3}[.][0-9]{1,3}$/}
        }

        FlatInput {
            id: porcentajeGras
            width: 150
            height: 34.9
            verticalAlignment: 128
            horizontalAlignment: 1
            opacity: 1
            anchors.left: frecuenciaRespiratoria1.right
            placeholderText: "% Grasa"
            anchors.topMargin: 20
            anchors.leftMargin: 10
            echoMode: -8
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9]{1,4}[%]$/}
        }

        FlatInput {
            id: kgGrasa
            width: 150
            height: 35
            anchors.left: porcentajeGras.right
            placeholderText: "Kgs Grasa"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[a-z0-9\s]{10}$/}
        }

        FlatInput {
            id: kgsMagra
            height: 35
            anchors.left: kgGrasa.right
            placeholderText: "Kgs Magra"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[a-z0-9\s]{10}$/}
        }
        anchors.left: parent.left
        anchors.topMargin: 20
        anchors.leftMargin: 10
        spacing: 6
        anchors.top: row2.bottom
    }

    Row {
        id: row4
        x: 20
        y: 0
        width: 700
        height: 66
        FlatInput {
            id: porcentajeAgua
            width: 218
            height: 35
            anchors.left: parent.left
            placeholderText: "% Agua"
            anchors.topMargin: 20
            anchors.leftMargin: 10
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[0-9]{1,4}[%]$/}
        }

        FlatInput {
            id: kgsAgua
            width: 150
            height: 34.9
            verticalAlignment: 128
            horizontalAlignment: 1
            opacity: 1
            anchors.left: porcentajeAgua.right
            placeholderText: "Kgs Agua"
            anchors.topMargin: 20
            anchors.leftMargin: 10
            echoMode: -8
            anchors.top: parent.top
            validator: RegExpValidator{regExp: /^[a-z0-9\s]{10}$/}
        }
        anchors.left: parent.left
        anchors.topMargin: 20
        spacing: 6
        anchors.leftMargin: 10
        anchors.top: row3.bottom
    }

    FlatSuccessButton {
        id: guardarDiagnostico
        x: 492
        text: "Guardar"
        highlightColor: "#63c5da"
        checkedColor: "#59788e"
        pressColor: "#59788e"
        color: "#3498db"
        anchors.top: row4.bottom
        anchors.topMargin: 10
    }

}
