/*
    This file is part of PyPass

    PyPass is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.5
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

ApplicationWindow {
    id: applicationWindow
    title: 'PyPass'
    property int margin: 10
    width: Screen.width
    height: 195

    flags: Qt.FramelessWindowHint | Qt.Window

    function moveUp() {
        if (resultList.currentIndex > 0)
            resultList.currentIndex -= 1
    }

    function moveDown() {
        if (resultList.currentIndex < resultList.maximumIndex)
            resultList.currentIndex += 1
    }

    Shortcut {
        sequence: "Up"
        onActivated: moveUp()
    }

    Shortcut {
        sequence: "Ctrl+K"
        onActivated: moveUp()
    }

    Shortcut {
        sequence: "Down"
        onActivated: moveDown()
    }

    Shortcut {
        sequence: "Ctrl+J"
        onActivated: moveDown()
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: margin
        RowLayout {
            Layout.fillWidth: true
            TextField {
                objectName: "searchInput"

                font.pixelSize: 24
                focus: true

                Layout.fillWidth: true
            }
        }
        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true

            ListView {
                id: resultList
                objectName: "resultList"

                property int maximumIndex: listViewModelIndexMax

                model: listViewModel

                delegate: Text { 
                    text: display
                    font.pixelSize: 18
                    font.italic: text.indexOf(' ') >= 0 ? true : false
                    color: resultList.currentIndex === index ? "red" : "steelblue"
                }

                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
        Text {
            objectName: "errorMessage"
            color: "black"
        }
    }
}
