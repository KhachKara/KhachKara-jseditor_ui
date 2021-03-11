import QtQuick 2.9
import QtQuick.Controls 2.15

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
