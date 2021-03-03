import QtQuick 2.9
import QtQuick.Window 2.15
import QtQml 2.3
import QtQml.Models 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


Window {
    id: root
    property string projectName: "JsonEditor"
    width: 1000
    height: 600
    color: "#d9d9d9"
    visible: true
    title: qsTr(projectName)

    // строка меню
    property variant menuItems: ["Open", "Save", "Close", "Auto", "Synchronise"]
    property int borderWidth: 1
    property int space: 10
    Item {
        id: item1
        width: rowMenu.width
        height: rowMenu.height

        Row{
            spacing: space
            id: rowMenu
            x: space
            y: space
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
                        Text {
                            id: menuTxt
                            padding: space
                            anchors.centerIn: parent
                            text: menuItems[index]
                            font.pointSize: 12
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

    // блок ввода jsom
    Item {
        id: item2
        width: item1.width
        height: root.height - item1.height
        Rectangle{
            id: item2Rect
            x: item1.x + space
            y: item1.y + item1.height + 2 * space
            width: item1.width
            height: root.height - item1.height - 3 * space
            border.color: "black"
            border.width: borderWidth
            color: "yellow"
        }
    }

    // блок вывода json
    Item {
        id: item3
        width: item2.width
        height: root.height - item1.height
        Rectangle{
            id: item3Rect
            x: item1.x + item1.width + 2 * space
            y: item1.y + item1.height + 2 * space
            width: item1.width
            height: root.height - item1.height - 3 * space
            border.color: "black"
            border.width: borderWidth
            color: "cyan"
        }
    }

    // блок управления
    Item {
        id: item4
        width: root.width - item2Rect.width - item3Rect.width - 4 * space
        height: 180
        Rectangle{
            id: item4Rect
            x: item2.x + item2.width + item3.x + item3.width + 3 * space
            y: item1.y + item1.height + 2 * space
            width: item4.width
            height: item4.height
            border.color: "black"
            border.width: borderWidth
            color: "blue"
        }
    }

    // блок потомки родственники
    Item {
        id: item5
        width: root.width - item2Rect.width - item3Rect.width - 4 * space
        height: 120
        Rectangle{
            id: item5Rect
            x: item2.x + item2.width + item3.x + item3.width + 3 * space
            y: root.height - height - space
            width: item5.width
            height: item5.height
            border.color: "black"
            border.width: borderWidth
            color: "green"
        }
    }
}

