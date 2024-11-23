/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

import QtQuick
import QtQuick.Controls
import QtWebEngine

Row {
    height: 48
    property WebEngineView webview
    property alias urltext: urltext

    NavButton {
        icon.source: "../icons/back.png"
        onClicked: webview.goBack()
        enabled: webview.canGoBack
    }

    NavButton {
        icon.source: "../icons/forward.png"
        onClicked: webview.goForward()
        enabled: webview.canGoForward
    }

    NavButton {
        icon.source: "../icons/execute.png"
        onClicked: webview.getInfo()
    }

    Item {
        width: 8
        height: parent.height
    }

    TextField {
        id: urltext
        y: (parent.height - height) / 2
        text: webview.url
        width: parent.width - (parent.height * 3.6) - 16
        color: palette.windowText
        onAccepted: webview.url = text
    }
}
