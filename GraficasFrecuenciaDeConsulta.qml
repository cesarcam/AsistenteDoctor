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
      anchors.rightMargin: 150

      columns: 4;
      spacing: chart_spacing;

      QChartJs {
          id: chart_line
          height: 300
          anchors.right: parent.right
          anchors.rightMargin: 50
          anchors.top: parent.top
          anchors.topMargin: 30
          anchors.left: parent.left
          anchors.leftMargin: 30
          chartType: ChartTypes.QChartJSTypes.LINE
          chartData: ChartsData.ChartLineData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;

          //Grafica Mensual//Frecuencia de consulta//
      }

      QChartJs {
          id: chart_bar
          height: 300
          anchors.right: parent.right
          anchors.rightMargin: 50
          anchors.left: parent.left
          anchors.leftMargin: 30
          anchors.top: chart_line.bottom
          anchors.topMargin: 20
          chartType: ChartTypes.QChartJSTypes.BAR
          chartData: ChartsData.ChartBarData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;

          //Grafica Mensual de barras//Frecuencia de consulta//
      }
}
}
