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
    property int borderWidth: 1
    property int space: 10
    property string textAreaColor: "#e9e9e9"

    width: 1000
    height: 600
    color: "#d9d9d9"
    visible: true
    title: qsTr(projectName)

    // строка меню
    MenuBlock{
        id: item1
    }

    // блок ввода jsom
    JsonInputOutput{
        id: item2
        anchors.top: item1.bottom
        anchors.topMargin: space
        anchors.left: item1.left
        anchors.leftMargin: space

        ScrollView{
            id: scrollView1
            anchors.fill: parent
            TextArea{
                anchors.centerIn: item2
                focus: true
                placeholderText: "Json Input"
                width: parent.width - 2 * space
                height: parent.height - 2 * space
                text: ""
                font.pointSize: fontPointSize
            }
        }
    }

    // блок вывода json
    JsonInputOutput {
        id: item3

        anchors.top: item2.top
        anchors.left: item2.right
        anchors.leftMargin: space

        ScrollView{
            id: scrollView2
            anchors.fill: parent
            TextArea{
                anchors.centerIn: item3
                focus: true
                placeholderText: "Json Output"
                width: parent.width - 2 * space
                height: parent.height - 2 * space
                text: ""
                font.pointSize: fontPointSize
            }
        }
    }

    // блок управления

    ManagmentBlock{
        id: item4
        anchors.top: item3.top
        anchors.left: item3.right
        anchors.leftMargin: space
    }


    // логотип
    Image {
        id: logo
        width: item4.width
        height: 10

        anchors.top: item4.bottom
        anchors.bottom: item5.top
        anchors.left: item4.left

        source: "images/jsoneditor_logo.svg"
        fillMode: Image.PreserveAspectFit

    }

    // блок потомки родственники
    ButtonBlock {
        id: item5

        anchors.left: item3.right
        anchors.leftMargin: space
        anchors.bottom: item3.bottom

        width: item4.width
        height: 60

        onClickedChild: {
            console.log("add child")
        }

        onClickedSibling: {
            console.log("add sibling")
        }
    }
}

