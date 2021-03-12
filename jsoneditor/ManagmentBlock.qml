import QtQuick 2.9
import QtQuick.Controls 2.15

Item {
        width: 250
        height: 180


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
