import QtQuick 2.9
import QtQuick.Controls 2.15

Item {
    property string textAreaColor: "#e9e9e9"

    id: item2
    width: (root.width - item4.width - 4 * space) / 2
    height: root.height - item1.height - 2 * space

    Rectangle{


        width: parent.width
        height: item2.height
        border.color: "black"
        border.width: borderWidth
        color: textAreaColor

    }
}
