import "."
import "../controlador/QMLChartData.js" as ChartsData
import "../controlador/QchartJsTypes.js" as ChartTypes
import "../flatui"
import QtQuick 2.0
import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.4

Item {
    id: item1
    anchors.fill: parent

    Grid {

        id: layout;

        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 10

        columns: 4;
        spacing: chart_spacing;

        QChartJs {
            id: chart_line
            height: 600
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: val1.left
            anchors.rightMargin: 10
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.ChartLineData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;

            //Grafica Mensual//Frecuencia de Evolucion//
        }

        TextField
        {
            id:val1
            width: 150
            text: qsTr("")
            placeholderText: "valor 1"
            anchors.right: parent.right
            anchors.rightMargin: 10
            readOnly: false

        }
        TextField
        {
            id:val2
            width: 150
            text: qsTr("")
            placeholderText: "valor 2"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: val1.bottom
            anchors.topMargin: 10
            readOnly: false
            anchors.bottom:val1
            anchors.bottomMargin: 10

        }
        TextField
        {
            id: valor3
            width: 150
            text: qsTr("")
            placeholderText: "valor 3"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: val2.bottom
            anchors.topMargin: 10
            readOnly: false
            anchors.bottom:val2
            anchors.bottomMargin: 10

        }

        TextField {
            id: valor4
            width: 150
            text: qsTr("")
            placeholderText: "valor 4"
            anchors.right: parent.right
            anchors.rightMargin: 10
            readOnly: false
            anchors.bottom: val2
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.top: valor3.bottom
        }

        TextField {
            id: valor5
            width: 150
            text: qsTr("")
            placeholderText: "valor 5"
            anchors.right: parent.right
            anchors.rightMargin: 10
            readOnly: false
            anchors.bottom: val2
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.top: valor4.bottom
        }


    }
}
