import QtQuick 2.9
import QtQuick.Window 2.15
import QtQml 2.3
import QtQml.Models 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3


Window {
    id: root
    property string projectName: "JsonEditor"
    property int fontPointSize: 12
    property string textAreaColor: "#e9e9e9"
    property variant validTypes: ["int", "string", "double", "bool", "undefined"]

    width: 1000
    height: 600
    color: "#d9d9d9"
    visible: true
    title: qsTr(projectName)


    property variant menuItems: ["Open", "Save", "Close", "Auto", "Synchronise"]
    property int borderWidth: 1
    property int space: 10

    // строка меню
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
            color: textAreaColor
            ScrollView{
                id: scrollView1
                anchors.fill: parent
                TextArea{
                    anchors.centerIn: item2Rect
                    focus: true
                    placeholderText: "Json Input"
                    width: parent.width - 2 * space
                    height: parent.height - 2 * space
                    text: ""
                    font.pointSize: fontPointSize
                }
            }
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
            color: textAreaColor
            ScrollView{
                id: scrollView2
                anchors.fill: parent
                TextArea{
                    anchors.centerIn: item2Rect
                    focus: true
                    placeholderText: "Json Output"
                    width: parent.width - 2 * space
                    height: parent.height - 2 * space
                    text: ""
                    font.pointSize: fontPointSize
                }
            }
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
            //            border.color: "black"
            //            border.width: borderWidth
            color: root.color
            Column{
                spacing: - borderWidth
                Row{
                    id: row1
                    Rectangle{
                        id: keyRect
                        width: item4Rect.width / 3
                        height: item4Rect.height / 3
                        border.color: "black"
                        border.width: borderWidth
                        color: textAreaColor
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: space
                            id: keyText
                            text: qsTr("Key")
                            font.pointSize: fontPointSize
                        }
                    }
                    Rectangle{
                        width: item4Rect.width - keyRect.width
                        height: item4Rect.height / 3
                        border.color: "black"
                        border.width: borderWidth
                        color: textAreaColor
                        TextField{
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: space
                            width: parent.width - 2 * space
                            height: parent.height
                            text: ""
                            font.pointSize: fontPointSize
                            focus: true
                            background: textAreaColor
                        }
                    }
                }
                Row{
                    id: row2
                    Rectangle{
                        id: typeRect
                        width: item4Rect.width / 3
                        height: item4Rect.height / 3
                        border.color: "black"
                        border.width: borderWidth
                        color: textAreaColor
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: space
                            id: typeText
                            text: qsTr("Type")
                            font.pointSize: fontPointSize
                        }
                    }
                    Rectangle{
                        width: item4Rect.width - typeRect.width
                        height: item4Rect.height / 3
                        border.color: "black"
                        border.width: borderWidth
                        color: textAreaColor
                        ComboBox {
                            id: combo
                            anchors.centerIn: parent
                            width: parent.width - 2 * borderWidth
                            height: parent.height - 2 * borderWidth
                            editable: false
                            font.pointSize: fontPointSize
                            model: ListModel {
                                id: model
                                ListElement { text: "int" }
                                ListElement { text: "double" }
                                ListElement { text: "string" }
                                ListElement { text: "bool" }
                                ListElement { text: "undefined" }
                            }
                            onAccepted: {
                                if (find(editText) === -1)
                                    model.append({text: editText})
                            }
                        }
                    }
                }
                Row{
                    id: row3
                    Rectangle{
                        id: valueRect
                        width: item4Rect.width / 3
                        height: item4Rect.height / 3
                        border.color: "black"
                        border.width: borderWidth
                        color: textAreaColor
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: space
                            id: valueText
                            text: qsTr("Value")
                            font.pointSize: fontPointSize
                        }
                    }
                    Rectangle{
                        width: item4Rect.width - valueRect.width
                        height: item4Rect.height / 3
                        border.color: "black"
                        border.width: borderWidth
                        color: textAreaColor
                        TextField{
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: space
                            width: parent.width - 2 * space
                            height: parent.height
                            text: ""
                            font.pointSize: fontPointSize
                            focus: true
                            background: textAreaColor
                        }
                    }
                }
            }
        }
    }

    // блок потомки родственники
    Item {
        id: item5
        width: root.width - item2Rect.width - item3Rect.width - 4 * space
        height: 60
        Rectangle{
            id: item5Rect
            x: item2.x + item2.width + item3.x + item3.width + 3 * space
            y: root.height - height - space
            width: item5.width
            height: item5.height
            border.color: "black"
            border.width: borderWidth
            color: "green"
            Row{
                Rectangle{
                    width: item5Rect.width / 2
                    height: item5Rect.height
                    border.color: "black"
                    border.width: borderWidth
                    Button{
                        anchors.centerIn: parent
                        width: parent.width - 2 * borderWidth
                        height: parent.height - 2 * borderWidth
                        text: "Add Child"
                        font.pointSize: fontPointSize
                        onClicked:
                        {
                            console.log(text)
                        }
                    }
                }
                Rectangle{
                    width: parent.width / 2
                    height: parent.height
                    border.color: "black"
                    border.width: borderWidth
                    Button{
                        anchors.centerIn: parent
                        width: parent.width - 2 * borderWidth
                        height: parent.height - 2 * borderWidth
                        text: "Add Sibblings"
                        font.pointSize: fontPointSize
                        onClicked:
                        {
                            console.log(text)
                        }
                    }
                }
            }
        }
    }
}

