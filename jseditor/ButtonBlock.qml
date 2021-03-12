import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    id: root
    signal clickedChild()
    signal clickedSibling()
    Button{
        id: addChild
        anchors.left: parent.left
        width: parent.width / 2
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

        onClicked: {
            root.clickedChild()
        }
    }


    Button{
        id: chSibl
        anchors.right: parent.right
        width: parent.width / 2
        height: parent.height
        text: "Add Sibling"
        font.pointSize: fontPointSize

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
            color: chSibl.down ? "#d0d0d0" : "#e0e0e0"
            border.color: "black"
            border.width: borderWidth
        }

        onClicked: {
            root.clickedSibling()
        }
    }
}
