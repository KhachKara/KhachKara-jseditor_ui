import QtQuick 2.9
import QtQuick.Controls 2.15

Item {
    width: (root.width - item4.width - 4 * space) / 2
    height: root.height - item1.height - 2 * space

    Rectangle{
        width: parent.width
        height: parent.height
        border.color: "black"
        border.width: borderWidth
        color: textAreaColor
    }
}
