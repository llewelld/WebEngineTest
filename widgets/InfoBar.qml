/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

import QtQuick

Row {
    id: infobar
    height: 28
    anchors.horizontalCenter: parent.horizontalCenter

    property var dominfo: {
        "nodes": 0,
        "maxdepth": 0,
        "maxbreadth": 0
    }

    Text {
        id: nodes
        text: qsTr("Node count: %1").arg(infobar.dominfo.nodes)
        height: 28
        width: 200
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20
    }

    Text {
        id: depth
        height: 28
        text: qsTr("DOM height: %1").arg(infobar.dominfo.maxdepth)
        width: 200
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20
    }

    Text {
        id: breadth
        text: qsTr("DOM width: %1").arg(infobar.dominfo.maxbreadth)
        height: 28
        width: 200
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20
    }
}
