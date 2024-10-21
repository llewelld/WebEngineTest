import QtQuick
import QtQuick.Controls
import QtWebEngine
import "."

Row {
    id: toolbar
    height: 50
    property WebEngineView webview
    property alias urltext: urltext

    ToolButton {
        icon.name: "go-previous"
        onClicked: toolbar.webview.goBack()
        enabled: toolbar.webview.canGoBack
    }

    ToolButton {
        icon.name: "go-next"
        onClicked: toolbar.webview.goForward()
        enabled: toolbar.webview.canGoForward
    }

    ToolButton {
        icon.name: "gtk-info"
        onClicked: toolbar.webview.getInfo()
    }

    TextField {
        id: urltext
        height: 50
        text: toolbar.webview.url
        width: parent.width - 200
        verticalAlignment: TextEdit.AlignVCenter
        leftPadding: 20
        onAccepted: toolbar.webview.url = text
    }
}
