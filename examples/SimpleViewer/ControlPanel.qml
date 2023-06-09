// SPDX-FileCopyrightText: 2023 Jonas Kalinka <jonas.kalinka@basyskom.com>
// SPDX-FileCopyrightText: 2023 basysKom GmbH

// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    id: root

    color: "white"

    property alias model: buttonRepeater.model
    property int lastClicked: -1
    property bool advandedText: false
    property alias title: title.text

    clip: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 32

        Text {
            id: title
            text: "Title"
            color: "black"
        }

        ScrollView {
            id: scrollView
            Layout.fillHeight: true
            Layout.preferredWidth: advandedText ? 300 : 200
            clip: true
            background: Rectangle {
                color: "white"
            }

            Column {
                id: buttonColumn
                anchors.fill: parent
                spacing: 16

                Repeater {
                    id: buttonRepeater

                    delegate: Button {
                        id: buttonDelegate
                        text: "ID: " + modelData.id + ", Name: " + modelData.name
                              + (root.advandedText ? ", Duration: " + modelData.duration + ", FPS: " + modelData.fps : "")
                        onClicked: {
                            root.lastClicked = modelData.id !== undefined ? modelData.id : 0
                        }
                    }
                }
            }
        }
    }
}
