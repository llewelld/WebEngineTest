/* vim: set et ts=4 sts=4 sw=4: */
/* SPDX-License-Identifier: BSD-2-Clause */
/* Copyright © 2024 David Llewellyn-Jones */

import QtQuick

Row {
    height: 32
    anchors.horizontalCenter: parent.horizontalCenter

    property var dominfo: {
        "nodes": 0,
        "maxdepth": 0,
        "maxbreadth": 0
    }

    InfoText {
        text: qsTr("Node count: %1").arg(dominfo.nodes)
    }

    InfoText {
        text: qsTr("DOM height: %1").arg(dominfo.maxdepth)
    }

    InfoText {
        text: qsTr("DOM width: %1").arg(dominfo.maxbreadth)
    }
}
