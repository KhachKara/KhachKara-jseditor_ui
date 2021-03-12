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
            Rectangle{
                width: menuTxt.width
                height: menuTxt.height
                border.width: borderWidth
                border.color: "black"
                Button{
                    width: menuTxt.width  - 2 * borderWidth
                    height: menuTxt.height - 2 * borderWidth
                    anchors.centerIn: parent
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
}
