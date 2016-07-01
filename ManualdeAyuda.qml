import QtQuick 2.0
import QtWebKit 3.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

Window{
    id:ayuda
    width: 700
    height: 420


ScrollView {
   anchors.rightMargin: 10
   anchors.leftMargin: 10
   anchors.bottomMargin: 10
   anchors.topMargin: 10
   anchors.fill: parent
   WebView {
       id: webview
       url: "http://linx4.dscorp.com.mx:8089/calculadora/manual/"
       anchors.fill: parent
       onNavigationRequested: {
           // detect URL scheme prefix, most likely an external link
           var schemaRE = /^\w+:/;
           if (schemaRE.test(request.url)) {
               request.action = WebView.AcceptRequest;
           } else {
               console.log("no cargo")
               request.action = WebView.IgnoreRequest;
               // delegate request.url here
           }
       }
   }
}
}
