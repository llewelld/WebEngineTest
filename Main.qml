import QtQuick
import QtWebEngine
import "widgets"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QtWebEngine Test")

    Column {
        id: column
        anchors.fill: parent

        ToolBar {
            id: toolbar
            webview: webview
            width: parent.width
        }

        WebEngineView {
            id: webview
            width: parent.width
            height: parent.height - toolbar.height - infobar.height
            url: "https://www.whatsmybrowser.org"
            onUrlChanged: toolbar.urltext.text = url
            settings.javascriptEnabled: true

            function getInfo() {
                runJavaScript(domwalk, function(result) {
                    infobar.dominfo = JSON.parse(result);
                });
            }
        }

        InfoBar {
            id: infobar
        }
    }
}
