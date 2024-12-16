import Felgo
import QtQuick
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtQuick.Layouts 1.12
App {
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    Window {
        width: 640
        height: 480
        visible: true
        title: qsTr("Task_for_login_page")
        StackView{
         id:stack_view
         anchors.fill: parent
         initialItem: page1
         }
         Page { id:page1
             anchors.fill: parent
             Rectangle{
                 width:parent.width
                 height:parent.height
                 color:"lightgrey"
                 TextField{
                     id:loginfield
                     y:50
                     width:300
                     height:40
                     anchors.horizontalCenter: parent.horizontalCenter
                     placeholderText: "Login"
                     font.pixelSize: 24
                     color: focus ? "black" : "grey"
                     focus:true
                 }
                 TextField{
                     id:passwordfield
                     y:150
                     width:300
                     height:40
                     anchors.horizontalCenter: parent.horizontalCenter
                     placeholderText: "Password"
                     echoMode: TextInput.Password
                     font.pixelSize: 24
                     color: focus ? "black" : "grey"
                 }
                 Button {
                     id:login
                     anchors.left: parent.left
                     anchors.bottom: parent.bottom
                     anchors.margins: 30 // look into main.qml
                     text:"Login"
                     onClicked: {
                         if (loginfield.text==="login" && passwordfield.text==="password"){
                             loginfield.text=""
                             passwordfield.text=""
                             stack_view.push(page2)
                         }
                     }
                 }
                 Button {
                     id:clear
                     anchors.right: parent.right
                     anchors.bottom: parent.bottom
                     anchors.margins: 30 // look into main.qml
                     text:"Clear"
                     onClicked: {
                         loginfield.text=""
                         passwordfield.text=""
                     }
                 }

             }
         }
         Page { id:page2
             visible: false
             anchors.fill: parent
             Text{
                 y:100
                 width:300
                 height:40
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:"You logined"
             }
             Button {
                 y:200
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.margins: 30 // look into main.qml
                 text:"Back"
                 onClicked: {
                     stack_view.pop(page1)
                 }
             }
         }
    }
    Window {
        width: 640
        height: 480
        visible: true
        title: qsTr("Task_for_login_page")
        StackView{
         id:stack_view2
         anchors.fill: parent
         initialItem: page3
         }
         Page { id:page3

            ColumnLayout{
                anchors.fill:parent
                Text{
                    id:passwordField
                    text:passwordField.text
                    visible:false
                }
                Text {
                    text: "Enter your password:"
                    font.pixelSize: 16
                    Layout.alignment: Qt.AlignCenter
                }
                Rectangle {
                    color: "white"
                    border.width: 2
                    border.color: "black"
                    width: parent.width
                    height: 50
                    Layout.alignment: Qt.AlignCenter
                    Row {
                        spacing: 6
                        anchors.centerIn: parent
                        // Добавляем 6 элементов Label для отображения введенных символов
                        Repeater {
                            model:6
                            Label {
                                width: 20
                                height: 20
                                 font.pixelSize: 36
                                 text: "*"
                                  Layout.alignment: Qt.AlignCenter
                                  color:index <passwordField.text.length ? "black" : "light grey"
                            }
                        }
                    }

                    }
                GridLayout {
                    id: keypad
                    rows: 4
                    columns: 3
                    width: parent.width
                    Button {
                        text: "1"
                        onClicked: passwordField.text += "1"
                    }
                    Button {
                        text: "2"
                        onClicked: passwordField.text+= "2"
                    }
                    Button {
                        text: "3"
                        onClicked: passwordField.text+= "3"
                    }
                    Button {
                        text: "4"
                        onClicked: passwordField.text += "4"
                    }
                    Button {
                        text: "5"
                        onClicked: passwordField.text+= "5"
                    }
                    Button {
                        text: "6"
                        onClicked: passwordField.text += "6"
                    }
                    Button {
                        text: "7"
                        onClicked: passwordField.text+= "7"
                    }
                    Button {
                        text: "8"
                        onClicked: passwordField.text += "8"
                    }
                    Button {
                        text: "9"
                        onClicked: passwordField.text+= "9"
                    }
                    Button {
                        text: "Login"
                        onClicked:{
                            if (passwordField.text==="123456"){
                                passwordField.text=""
                                stack_view2.push(page4)
                            }
                        }
                    }
                    Button {
                        text: "0"
                        onClicked: passwordField.text += "0"
                    }
                    Button {
                        text: "Clear"
                        onClicked:{
                            passwordField.text=""
                        }
                    }
                }
            }
         }
         Page { id:page4
             visible: false
             anchors.fill: parent
             Text{
                 y:100
                 width:300
                 height:40
                 anchors.horizontalCenter: parent.horizontalCenter
                 text:"You logined"
             }
             Button {
                 y:200
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.margins: 30 // look into main.qml
                 text:"Back"
                 onClicked: {
                     stack_view2.pop(page3)
                 }
             }
         }
    }
}


