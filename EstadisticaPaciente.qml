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

    Flow {

      clip: true
      id: layout;
      anchors.top: parent.top
      anchors.topMargin: 10
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 10
      anchors.left: parent.left
      anchors.leftMargin: 10
      anchors.right: parent.right
      anchors.rightMargin: 250

      //Wcolumns: 4;
      spacing: chart_spacing;

      QChartJs {
          id: chart_line
          width: chart_width
          height: chart_height
          chartType: ChartTypes.QChartJSTypes.LINE
          chartData: ChartsData.ChartLineData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;
      }

      QChartJs {
          id: chart_bar
          width: chart_width
          height: chart_height
          chartType: ChartTypes.QChartJSTypes.BAR
          chartData: ChartsData.ChartBarData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;
      }

      QChartJs {
          id: chart_doughnut
          width: chart_width
          height: chart_height
          chartType: ChartTypes.QChartJSTypes.DOUGHNUT
          chartData: ChartsData.ChartDoughnutData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;
      }

      QChartJs {
          id: chart_pie
          width: chart_width
          height: chart_height
          chartType: ChartTypes.QChartJSTypes.PIE
          chartData: ChartsData.ChartPieData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;
      }

      QChartJs {
          id: chart_polar
          width: chart_width
          height: chart_height
          chartType: ChartTypes.QChartJSTypes.POLARAREA
          chartData: ChartsData.ChartPolarData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;
      }

      QChartJs {
          id: chart_radar
          width: chart_width
          height: chart_height
          chartType: ChartTypes.QChartJSTypes.RADAR
          chartData: ChartsData.ChartRadarData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;
      }

      QChartJs {
          id: chart_stack_bar
          width: chart_width
          height: chart_height
          chartType: ChartTypes.QChartJSTypes.STACKED_BAR
          chartData: ChartsData.StackedBarData
          animation: true
          chartAnimationEasing: Easing.InOutElastic;
          chartAnimationDuration: 2000;
      }
    }
    Column{
        id:menu
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: layout.right
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        Rectangle{
            color: "#ccc"
            anchors.fill: parent
        }

        FlatDropdown{
            text: "Propiedad"
            model: ListModel{
                ListElement{ item: "Propiedad 1"}
                ListElement{ item: "Propiedad 2"}
                ListElement{ item: "Propiedad 3"}
                ListElement{ item: "Propiedad 4"}
            }
        }
    }
}
