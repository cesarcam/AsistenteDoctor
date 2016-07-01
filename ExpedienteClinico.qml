import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
TabView{
    id:expedienteClinico
    anchors.fill: parent
    transformOrigin: Item.Center
    Tab{
        title: "Datos Generales"
        DatosGenerales{}
    }
    Tab{
        title: "Ficha Clinica"
        FichaClinica{}
    }
    Tab{
        title: "Seguro Medico"
        SeguroMedico{}
    }
    Tab{
        title: "Consulta"
        Consultas{}
     }

    Tab{
        title: "Notas"
        Notas{}
    }
    Tab{
        title: "Multimedia"
        Multimedia{}
    }

    style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color:styleData.selected ? colorGeneralControles: "#3498db"
                implicitWidth: Math.max(text.width + 30, 80)
                implicitHeight: 50
                Text {
                    id: text
                    anchors.centerIn: parent
                    text: styleData.title
                    color: styleData.selected ? "white" : "black"
                }
            }
            frame: Rectangle { color: "#ffffff" }
        }
}

