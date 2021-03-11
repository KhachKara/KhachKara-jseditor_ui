import QtQuick 2.9
import QtQuick.Window 2.15
import QtQml 2.3
import QtQml.Models 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Window {
    id: root
    property string projectName: "Json Editor"
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


    // блок ввода jsom
    Item {
        id: item2
        width: (root.width - item4.width - 4 * space) / 2
        height: root.height - item1.height - 2 * space
        anchors.top: item1.bottom
        anchors.topMargin: space
        anchors.left: item1.left
        anchors.leftMargin: space
        Rectangle{
            id: item2Rect

            width: parent.width
            height: item2.height
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
        height: item2.height

        anchors.top: item2.top
        anchors.left: item2.right
        anchors.leftMargin: space

        Rectangle{
            id: item3Rect
            width: item2.width
            height: parent.height
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
        width: 250
        height: 180

        anchors.top: item3.top
        anchors.left: item3.right
        anchors.leftMargin: space

        Rectangle{
            id: item4Rect

            width: item4.width
            height: item4.height
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

    Item {
        id: logo
        width: item4.width
        height: 100
        anchors.top: item4.bottom
        anchors.topMargin: 80
        anchors.left: item4.left
        Image {
            id: name
            source: "images/jsoneditor_logo.svg"
        }
    }

    // блок потомки родственники
    Item {
        id: item5

        anchors.left: item3.right
        anchors.leftMargin: space
        anchors.bottom: item3.bottom

        width: item4.width
        height: 60
        Rectangle{
            id: item5Rect

            width: item5.width
            height: item5.height
            border.color: "black"
            border.width: borderWidth
            color: "green"
            Row{
                width: item5.width
                Rectangle{
                    width: item5Rect.width / 2
                    height: item5Rect.height

                    Button{
                        id: addChild
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        text: "Add Child"
                        font.pointSize: fontPointSize

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                            color: addChild.down ? "#d0d0d0" : "#e0e0e0"
                            border.color: "black"
                            border.width: borderWidth
                        }

                        onClicked:
                        {
                            console.log(text)
                        }
                    }
                }
                Rectangle{

                    width: parent.width / 2
                    height: parent.height

                    Button{
                        id: chSibl
                        anchors.centerIn: parent
                        width: parent.width
                        height: parent.height
                        text: "Add Siblings"
                        font.pointSize: fontPointSize

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                            color: chSibl.down ? "#d0d0d0" : "#e0e0e0"
                            border.color: "black"
                            border.width: borderWidth
                        }

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

