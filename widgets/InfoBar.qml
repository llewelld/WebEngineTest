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

    InfoLabel {
        text: qsTr("Node count: %1").arg(infobar.dominfo.nodes)
    }

    InfoLabel {
        text: qsTr("DOM height: %1").arg(infobar.dominfo.maxdepth)
    }

    InfoLabel {
        text: qsTr("DOM width: %1").arg(infobar.dominfo.maxbreadth)
    }
}
