import QtQuick
import QtQuick.Layouts 6.3
import QtQuick.Controls
import QtQuick.Controls.Material 2.12

Window {
    width: 500
    height: 500
    visible: true
    title: qsTr("Hello World")
    Material.theme: Material.Light
    Material.accent: Material.Blue

    GridLayout {
        id: gridLayout
        anchors.fill: parent
        columns: 3
        rows: 3
        rowSpacing: 0
        columnSpacing: 0

        Repeater {
            model: gridLayout.rows * gridLayout.columns
            delegate: Rectangle {
                id: cell
                property int cell_row: (modelData - cell_col) / 3
                property int cell_col: modelData % 3
                property bool occupied: false
                height: 50
                width: 50
                border.color: "black"
                border.width: 3
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"
                Image {
                    id: cellImage
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 20
                }
                MouseArea {
                    hoverEnabled: true
                    anchors.fill: parent
                    acceptedButtons: Qt.AllButtons
                    onClicked: mouse => {
                        console.log("Clicked", cell.cell_row, cell.cell_col, mouse.button)
                        if (!cell.occupied) {
                           cell.occupied = true
                           if (mouse.button === Qt.LeftButton) {
                               cellImage.source = "assets/icons/cross.png"
                           } else {
                               cellImage.source = "assets/icons/circle.png"
                           }
                        }
                    }
                }
            }
        }
    }
}
