import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import Qt.labs.platform 1.0

Window {
    id: root
    property int objCentrX: width / 2
    property int objCentrY: height / 2
    property int margin: height * 0.01

    maximumWidth: Screen.desktopAvailableWidth * 0.75
    maximumHeight: Screen.desktopAvailableHeight * 0.85
    minimumWidth: maximumWidth
    minimumHeight: maximumHeight

    visible: true
    title: qsTr("main window")

    property var bgColor: "#d4d4d4"
    property var bdrColor: "#b4b4b4"
    color: bgColor

    // ввод текста
    TextField{
        id: txtinput
        x: margin
        y: margin
        width: root.width - 2 * margin
        height: root.height * 0.05
        font.pixelSize: height * 0.5
        placeholderText: "ввод данных"

        TextInput{
            id: inputDatatxt
            width: parent
            leftPadding: margin
            height: parent
            font.pixelSize: txtinput.font.pixelSize
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                txtinput.placeholderText = ""
                inputDatatxt.focus = true
            }
        }
    }
    Row{
        spacing: margin
        x: margin
        y: txtinput.height + 2 * margin
        Rectangle{
            id: jsonCode
            width: root.width * 0.35
            height: root.height* 0.85
            border.width: margin / 5
            border.color: bdrColor
            ScrollView{
                width: parent.width
                height: parent.height
                clip: true
                TextArea{
                    id: jsnTextArea
                    width: root.width * 0.35
                    height: root.height* 0.85
                    placeholderText: "json file"
                    font.pointSize: txtinput.font.pointSize
                    clip: true
                    TextInput{
                        id: jsnDatatxt
                        width: parent
                        leftPadding: margin
                        height: parent
                        font.pixelSize: jsnTextArea.font.pixelSize
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            jsnTextArea.placeholderText = ""
                            jsnDatatxt.focus = true
                        }
                    }
                }
            }
        }
        Rectangle{
            id: jsonOutput
            width: root.width * 0.35
            height: root.height * 0.85
            border.width: margin / 5
            border.color: bdrColor
            ScrollView{
                width: parent.width
                height: parent.height
                clip: true
                TextArea{
                    id: jsonOutputtxtArea
                    width: parent
                    height: parent
                    font.pointSize: txtinput.font.pointSize
                    placeholderText: "output file"
                    clip: true
                    TextInput{
                        id: jsonOutputtxt
                        width: parent
                        leftPadding: margin
                        height: parent
                        font.pixelSize: jsonOutputtxtArea.font.pixelSize
                    }
                    MouseArea{
                        anchors.fill: jsonOutputtxtArea
                        onClicked: {
                            jsonOutputtxtArea.placeholderText = ""
                            jsonOutputtxt.focus = true
                        }
                    }
                }
            }
        }
        Rectangle{
            id: tools
            width: txtinput.width - x
            height: root.height* 0.85
            border.width: margin / 5
            border.color: bdrColor
            Column{
                spacing: -1
                Row{
                    id: keyRow
                    Rectangle{
                        id: keyRect
                        width: tools.width * 0.25
                        height: tools.height * 0.05
                        x: x + margin
                        y: y + margin
                        border.color: bdrColor
                        border.width: 1
                        Text {
                            anchors.centerIn: parent
                            id: keytxt
                            font.pointSize: 12
                            text: qsTr("Key")
                        }
                    }
                    Rectangle{
                        x: margin
                        y: margin
                        width: tools.width - x - margin
                        height: tools.height * 0.05
                        border.color: bdrColor
                        border.width: 1
                        TextInput{
                            id: keyInputTxt
                            anchors.centerIn: parent
                            font.pointSize: 12
                            text: "key input"
                        }
                        MouseArea{
                            anchors.fill: keyInputTxt
                            onClicked: {
                                keyInputTxt.text = ""
                                keyInputTxt.focus = true
                            }
                        }
                    }
                }
                Row{
                    id: valueRow
                    Rectangle{
                        id: valueRect
                        width: tools.width * 0.25
                        height: tools.height * 0.05
                        x: x + margin
                        y: y + margin
                        border.color: bdrColor
                        border.width: 1
                        Text {
                            anchors.centerIn: parent
                            id: valuetxt
                            font.pointSize: 12
                            text: qsTr("value")
                        }
                    }
                    Rectangle{
                        x: margin
                        y: margin
                        width: tools.width - x - margin
                        height: tools.height * 0.05
                        border.color: bdrColor
                        border.width: 1
                        TextInput{
                            id: valueInputTxt
                            anchors.centerIn: parent
                            font.pointSize: 12
                            text: "value input"
                        }
                        MouseArea{
                            anchors.fill: valueInputTxt
                            onClicked: {
                                valueInputTxt.text = ""
                                valueInputTxt.focus = true
                            }
                        }
                    }
                }
                Row{
                    id: typeRow
                    bottomPadding: 2 * margin
                    Rectangle{
                        id: typeRect
                        width: tools.width * 0.25
                        height: tools.height * 0.05
                        x: x + margin
                        y: y + margin
                        border.color: bdrColor
                        border.width: 1
                        Text {
                            anchors.centerIn: parent
                            id: typetxt
                            font.pointSize: 12
                            text: qsTr("type")
                        }
                    }
                    Rectangle{
                        id: menueId
                        x: margin
                        y: margin
                        width: tools.width - x - margin
                        height: tools.height * 0.05
                        border.color: bdrColor
                        border.width: 1
                        Rectangle {
                            id:comboBox
                            property variant items: ["int", "string", "bool", "double", "undefimed"]
                            property alias selectedItem: chosenItemText.text;
                            property alias selectedIndex: listView.currentIndex;
                            signal comboClicked;

                            width: menueId.width - menueId.width * 0.1
                            height: menueId.height - menueId.height * 0.1
                            smooth:true
                            anchors.centerIn: parent

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                id:chosenItemText
                                text:comboBox.items[0];
                                font.family: "Arial"
                                font.pointSize: 14;
                                smooth:true
                            }

                            MouseArea {
                                anchors.fill: parent;
                                onClicked: {
                                    comboBox.state = comboBox.state==="dropDown"?"":"dropDown"
                                }
                            }

                            Rectangle {
                                id:dropDown
                                width:comboBox.width
                                clip:true
                                anchors.top: chosenItem.bottom
                                anchors.margins: 2
                                color: "lightgray"

                                ListView {
                                    id:listView
                                    height:500;
                                    model: comboBox.items
                                    currentIndex: 0
                                    delegate: Item{
                                        width:comboBox.width;
                                        height: comboBox.height;

                                        Text {
                                            text: modelData
                                            anchors.top: parent.top
                                            anchors.left: parent.left
                                            anchors.margins: 5
                                            font.pointSize: 14
                                        }
                                        MouseArea {
                                            anchors.fill: parent;
                                            onClicked: {
                                                comboBox.state = ""
                                                chosenItemText.text = modelData
                                            }
                                        }
                                    }
                                }
                            }

                            states: State {
                                name: "dropDown";
                                PropertyChanges { target: dropDown; height:40*comboBox.items.length }
                            }

                            transitions: Transition {
                                NumberAnimation { target: dropDown; properties: "height"; easing.type: Easing.OutExpo; duration: 1000 }
                            }
                        }
                    }
                }
                Rectangle{
                    id: buttonId
                    x: keyRow.x + margin
                    y: typeRect.y
                    z: -1

                    width: tools.width - 2 * margin
                    height: 10 * margin
                    Button{
                        width: parent.width
                        height: parent.height
                        anchors.centerIn: parent
                        text: "Edit"
                        font.pointSize: 16
                        onClicked: {
                            console.log(chosenItemText.text)
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        border.width: 1
        border.color: bdrColor
        x: margin
        y: jsonCode.y + jsonCode.height + 8 * margin
        width: root.width - 2 * margin
        height: root.height - y - margin
    }
}
