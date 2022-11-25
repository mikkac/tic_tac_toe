import QtQuick
import QtQuick.Layouts 6.3
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        columns: 3
        rows: 3
        rowSpacing: 5
        columnSpacing: 5
        anchors.margins: 5

        Repeater {
            model: gridLayout.rows * gridLayout.columns
            delegate: Rectangle {
                property int cell_row: (modelData - cell_col) / 3
                property int cell_col: modelData % 3
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#e3decf"
                Label {
                    anchors.fill: parent
                    color: "black"
                    text: "[" + cell_row + ", " + cell_col + "]"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 20
                    font.styleName: "Regular"
                    font.family: "Ubuntu"
                }

                MouseArea {
                    hoverEnabled: true
                    anchors.fill: parent
                    onClicked: {
                        console.log("Clicked", modelData % 3,
                                    (modelData - (modelData % 3)) / 3)
                    }
                }
            }
        }
    }
}
