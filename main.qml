import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: mainWindow
    title: "Dynamic QML"
    color: "white"
    visible: true
    visibility: Window.Maximized

    property int screenWidth: width
    property int screenHeight: height
    property int buttonWidth: screenWidth*0.70
    property int buttonHeight: screenHeight*0.06
    property int marginX: screenWidth*0.05
    property int marginY: screenHeight*0.02
    property int spacingX: buttonWidth*0.15
    property int spacingY: buttonHeight*0.15
    property int dynamicCount: 0
    property string globalProperty: "Hello, i am a global property"

    ColumnLayout {
        anchors.fill: parent
        spacing: spacingY

        Item {
            id: itemContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Button {
            text: "Create New Component"
            Layout.alignment: Qt.AlignCenter
            width: buttonWidth
            height: buttonHeight
            Layout.minimumWidth: buttonWidth
            Layout.minimumHeight: buttonHeight
            Layout.bottomMargin: spacingY

            onClicked: {
                var myComponent,myObject

                myComponent = Qt.createComponent("DynamicItem.qml"); // Create the object

                while (myComponent.status!==Component.Ready) // wait for ready
                {
                    //////
                }
                dynamicCount++ // number of objects created
                myObject = myComponent.createObject(itemContainer); // create the working object
                myObject.localProperty="Local property modified" // access to an object property
                myObject.myTestFunction() // executing a object method
                myObject.dynamicIndex=dynamicCount // set the object index
            }
        }
    }
}
