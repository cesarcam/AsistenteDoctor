import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

Window {
    id: window1
    visible: false
    property real   scaleFactor: Screen.pixelDensity / 5.0
    property int    intScaleFactor: Math.max(1, scaleFactor)


    property int    anchoPantalla: 1750
    property int    altoPantalla: 1420

    width: anchoPantalla*scaleFactor
    height: altoPantalla*scaleFactor

    property int chart_width: 300;
    property int chart_height: 300;
    property int chart_spacing: 20;
    property int text_height: 80;
    property int row_height: 8;

    color: "#ffffff";

    TabView{
        id: tabView1
        anchors.fill: parent
        Tab{
            title: "Exploracion"
            GraficaDeExploracion{}
        }
        Tab{
            title: "Evolucion"
            GraficasDeEvolucion{
            }
        }
        Tab{
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20
            title: "Frecuencia de la consulta"
            GraficasFrecuenciaDeConsulta{}
        }
    }
}
