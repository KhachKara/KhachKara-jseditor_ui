import QtQuick 2.9
import QtQuick.Controls 2.15

//
Item {
    property variant menuItems: ["Open", "Save", "Close", "Auto", "Synchronise"]
    width: root.width
    height: rowMenu.height

    Row{
        spacing: space
        id: rowMenu

        leftPadding: space
        topPadding: space

        Repeater{
            model: menuItems.length
            Button{
                id: control
                background: Rectangle{
                    implicitWidth: menuTxt.width
                    implicitHeight: menuTxt.height
                    border.width: borderWidth
                    border.color: "black"
                    color: control.down ? "#d0d0d0" : "#e0e0e0"
                }

                palette {
                    button: textAreaColor
                }
                Text {
                    id: menuTxt
                    padding: space
                    anchors.centerIn: parent
                    text: menuItems[index]
                    font.pointSize: fontPointSize
                }
                onClicked:
                {
                    console.log(menuTxt.text)
                }
            }
        }
    }
}
