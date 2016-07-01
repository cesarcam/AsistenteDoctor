import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
Window {


    width: 920
    height: 920


        property int chart_width: 300;
        property int chart_height: 300;
        property int chart_spacing: 20;
        property int text_height: 80;
        property int row_height: 8;

        color: "#ffffff";

    TabView{
        anchors.fill: parent
        Tab{
            title: "Pacientes"
            EstadisticaPaciente{}
        }
        Tab{
            title: "Consultas"
            EstadisticaPaciente{}
        }
        Tab{
            title: "Ingresos"
            EstadisticaPaciente{}
        }

        style: TabViewStyle {
               frameOverlap: 1
               tab: Rectangle {
                   color: styleData.selected ? "steelblue" :"lightsteelblue"
                   border.color:  "steelblue"
                   implicitWidth: Math.max(text.width + 4, 300)
                   implicitHeight: 50
                   radius: 2
                   Text {
                       id: text
                       anchors.centerIn: parent
                       text: styleData.title
                       color: styleData.selected ? "white" : "black"
                   }
               }
               frame: Rectangle { color: "white" }
           }
    }

}
