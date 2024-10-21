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
        text: "Node count: " + infobar.dominfo.nodes
        height: 28
        width: 200
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20
    }

    Text {
        id: depth
        height: 28
        text: "DOM height: " + infobar.dominfo.maxdepth
        width: 200
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20
    }

    Text {
        id: breadth
        text: "DOM width: " + infobar.dominfo.maxbreadth
        height: 28
        width: 200
        verticalAlignment: Text.AlignVCenter
        leftPadding: 20
    }
}
