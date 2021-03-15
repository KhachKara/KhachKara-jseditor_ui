import QtQuick 2.9
import QtQuick.Controls 2.15

Row{
    id: rowMenu

    property variant menuItems: ["Open", "Save", "Close", "Auto", "Synchronise"]
    property int borderWidth: 2
    property string borderColor: "blue"
    signal menuClicked(string text)
    signal menuIndClicked(int index)

    Repeater{
        model: menuItems.length
        Button{
            id: control
            background: Rectangle{
                border.width: borderWidth
                border.color: borderColor
                color: control.down ? "#d0d0d0" : "#e0e0e0"
            }
            contentItem:  Text {
                text: menuItems[index]
                font.pointSize: fontPointSize
            }
            onClicked: {
                menuClicked(menuItems[index])
                menuIndClicked(index)
            }
        }
    }
}
