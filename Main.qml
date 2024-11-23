/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

import QtQuick
import QtWebEngine
import "widgets"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QtWebEngine Test")
    color: palette.base

    Column {
        anchors.fill: parent

        NavBar {
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
