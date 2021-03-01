import QtQuick 2.9
import QtQuick.Window 2.15
import QtQml 2.3
import QtQml.Models 2.3
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3



Window {
    id: root
    property string projectName: "JsonEditor"
    minimumWidth: Screen.desktopAvailableWidth * 0.4
    minimumHeight: Screen.desktopAvailableHeight * 0.5
    maximumWidth: Screen.desktopAvailableWidth  * 0.6
    maximumHeight: Screen.desktopAvailableHeight * 0.75
    color: "#d9d9d9"
    visible: true
    title: qsTr(projectName)

    Row{
        id: rowBtns
        Button {
            id: btnOpen
            flat: true
            width: root.width * 0.06515
            height: root.height * 0.0385
            text: qsTr("open")
            onClicked: {
                console.log(minimumWidth)
                console.log(minimumHeight)
                console.log(width)
                console.log(height)

            }
        }
        Button {
            id: btnSave
            flat: true
            width: root.width * 0.06515
            height: root.height * 0.0385
            text: qsTr("save")
            //            onClicked: {
            //            }
        }
        Button {
            id: btnClose
            flat: true
            width: root.width * 0.06515
            height: root.height * 0.0385
            text: qsTr("close")
            //            onClicked: {
            //            }
        }
        Button {
            id: btnAuto
            flat: true
            width: root.width * 0.06515
            height: root.height * 0.0385
            text: qsTr("Auto")
            //            onClicked: {
            //            }
        }
        Button {
            id: btnsynch
            flat: true
            width: root.width * 0.06515
            height: root.height * 0.0385
            text: qsTr("synch")
            //            onClicked: {
            //            }
        }
    }
    Row{
        spacing: 0
        anchors.top: rowBtns.bottom
        Rectangle{
            id: jsInput
            width: root.width * 0.35
            height: root.height - rowBtns.y - rowBtns.height
            border.width: 1
            border.color: "#e5e5e5"
            ScrollView{
                anchors.fill: parent
                TextArea{
                    width: parent
                    height: parent
                    padding: root.width * 0.01
                    focus: true
                    clip: false
                    font.pixelSize: root.width * 0.02
                }
            }
        }

        Rectangle{
            id: jsOutput
            width: root.width * 0.35
            height: root.height - rowBtns.y - rowBtns.height
            border.width: 1
            border.color: "#e5e5e5"
            ScrollView{
                anchors.fill: parent
                TextArea{
                    width: parent
                    height: parent
                    padding: root.width * 0.01
                    focus: true
                    clip: false
                    font.pixelSize: root.width * 0.02
                }
            }
        }

        // managment tools
        Rectangle{
            id: managmentRect
            width: root.width - jsInput.width - jsOutput.width
            height: root.height - rowBtns.y
            Column{
                spacing: -1
                id: clmn

                // key
                Row{
                    width: keyRect.width + volueRect.width
                    height: keyRect.height
                    Rectangle{
                        id: keyRect
                        width: keyTxt.width + keyTxt.font.pixelSize
                        height: keyTxt.height + keyTxt.font.pixelSize
                        border.width: 1
                        border.color: "#e5e5e5"
                        Text {
                            id: keyTxt
                            anchors.centerIn: parent
                            font.pointSize: root.width * 0.02
                            text: "key"
                        }
                    }
                    Rectangle{
                        id: volueRect
                        width: managmentRect.width - keyRect.width
                        height: keyRect.height
                        border.width: 1
                        border.color: "#e5e5e5"
                        anchors.left: keyRect.right
                        anchors.top: keyRect.top
                        FocusScope {
                            anchors.fill: parent
                            TextField{
                                id: volueTxt
                                focus: true
                                width: volueRect.width
                                height: volueRect.height
                                font.pixelSize: root.width * 0.02
                            }
                        }
                    }
                }

                // type
                Row{
                    width: typeRect.width + typevalueRect.width
                    height: typeRect.height
                    Rectangle{
                        id: typeRect
                        width: keyTxt.width + keyTxt.font.pixelSize
                        height: keyTxt.height + keyTxt.font.pixelSize
                        border.width: 1
                        border.color: "#e5e5e5"
                        Text {
                            id: typeyTxt
                            anchors.centerIn: parent
                            font.pointSize: root.width * 0.015
                            text: "type"
                        }
                    }
                    Rectangle{
                        id: typevalueRect
                        width: managmentRect.width - keyRect.width
                        height: keyRect.height
                        border.width: 1
                        border.color: "#e5e5e5"
                        anchors.left: typeRect.right
                        anchors.top: typeRect.top
                        ComboBox {
                            width: parent.width
                            height: parent.height
                            editable: true
                            font.pixelSize: root.width * 0.02
                            model: ListModel {
                                id: model
                                ListElement { text: "int" }
                                ListElement { text: "double" }
                                ListElement { text: "string" }
                                ListElement { text: "bool" }
                            }
                            onAccepted: {
                                if (find(editText) === -1)
                                    model.append({text: editText})
                            }
                        }
                    }
                }

                // value
                Row{
                    width: keyRect.width + volueRect.width
                    height: keyRect.height
                    Rectangle{
                        id: valueRect
                        width: keyTxt.width + keyTxt.font.pixelSize
                        height: keyTxt.height + keyTxt.font.pixelSize
                        border.width: 1
                        border.color: "#e5e5e5"
                        Text {
                            id: valueValueTxt
                            anchors.centerIn: parent
                            font.pointSize: root.width * 0.02
                            text: "value"
                        }
                    }
                    Rectangle{
                        id: volueValueRect
                        width: managmentRect.width - keyRect.width
                        height: keyRect.height
                        border.width: 1
                        border.color: "#e5e5e5"
                        anchors.left: keyRect.right
                        anchors.top: keyRect.top
                        FocusScope {
                            anchors.fill: parent
                            TextField{
                                id: volueValueTxt
                                focus: true
                                width: volueRect.width
                                height: volueRect.height
                                font.pixelSize: root.width * 0.015
                            }
                        }
                    }
                }

                // btn edit
                Row{
                    Rectangle{
                        id: editBtnRect
                        width: managmentRect.width
                        height: 40
                        Button {
                            id: btnEdit
                            width: parent.width
                            height: parent.height
                            font.pointSize: root.width * 0.015
                            text: "edit"
                            //            onClicked: {
                            //            }
                        }
                    }
                }

                // btns apply save
                Rectangle{
                    id: aplSave
                    width: managmentRect.width
                    height: 20
                    x: editBtnRect.x
                    Row{
                        Button{
                            width: aplSave.width / 2
                            font.pointSize: root.width * 0.015
                            text: "Apply"
                            //            onClicked: {
                            //            }
                        }
                        Button{
                            width: aplSave.width / 2
                            font.pointSize: root.width * 0.015
                            text: "Save"
                            //            onClicked: {
                            //            }
                        }
                    }
                }

            }
        }
    }
}

