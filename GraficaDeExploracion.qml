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
    width: 3000
    height: 3000
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
            width: 400
            height: 400
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.ChartLineData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;

        }

        QChartJs {
            id: chart_doughnut
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.right: parent.right
            anchors.rightMargin: 50
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.top: chart_line.bottom
            anchors.topMargin: 20
            chartType: ChartTypes.QChartJSTypes.DOUGHNUT
            chartData: ChartsData.ChartDoughnutData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;

            //Grafica de circulo//Temperatura//
        }

    }
}
