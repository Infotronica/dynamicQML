import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    id: dynamicItem
    anchors.fill: parent
    property int dynamicIndex: 0
    property string localProperty: "Hello, i am a local property"

    Image {
        anchors.fill: parent
        source: "img_background/40679174_2226673147570438_3970761144200593408_o.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.30
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 50

        Label {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter
            text: "Hello I Am Dynamic Item Number "+dynamicIndex
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            background: Rectangle {
                color: "yellow"
            }
        }

        Item {
            Layout.fillHeight: true
        }

        Label {
            Layout.alignment: Qt.AlignCenter
            text: globalProperty
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            background: Rectangle {
                color: "white"
            }
        }

        Label {
            Layout.alignment: Qt.AlignCenter
            text: localProperty
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            background: Rectangle {
                color: "white"
            }
        }

        TextField {
            text: ""
            Layout.alignment: Qt.AlignHCenter
            placeholderText: "Write Some Text"
            selectByMouse: true
        }

        Label {
            id: textForTest
            Layout.alignment: Qt.AlignCenter
            text: " "
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            background: Rectangle {
                color: "white"
            }
        }

        Button {
            text: "Drop Component"
            Layout.alignment: Qt.AlignCenter
            width: buttonWidth
            height: buttonHeight
            Layout.minimumWidth: buttonWidth
            Layout.minimumHeight: buttonHeight
            Layout.bottomMargin: spacingY

            onClicked: {
                dynamicCount-- // decrease dynamic objects created
                dynamicItem.destroy() // destroy this object
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    function myTestFunction() // function accessed from outside
    {
        textForTest.text="Writen for myTestFunction()"
    }
}
