import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.3
import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.0
import Qt.labs.folderlistmodel 2.0
import org.kde.plasma.core 2.0

ColumnLayout {
    id: root
    spacing: units.largeSpacing / 2

    property string cfg_Image
    property int cfg_FillMode
    property bool cfg_Smooth

    GroupBox {
        title: i18nd("plasma_applet_org.kde.gif", "Background")
        Layout.fillWidth: true

        GridLayout {
            columnSpacing: units.largeSpacing / 2
            rowSpacing: units.largeSpacing / 2
            columns: 2

            Label {
                text: i18nd("plasma_applet_org.kde.gif", "Image:")
                Layout.alignment: Qt.AlignRight
            }

            Rectangle {
                border.color: "black"
                border.width: 1
                width: 160
                height: 90
                Image {
                    id: img1
                    anchors.margins: 2
                    anchors.fill: parent
                    fillMode: cfg_FillMode
                    source: cfg_Image
                    antialiasing: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: fileDialog.open()
                    }
                }
            }

            Label {
                text: i18nd("plasma_applet_org.kde.gif", "Positioning:")
                Layout.alignment: Qt.AlignRight
            }

            ComboBox {
                model: [
                    {
                        'label': i18nd("plasma_applet_org.kde.image", "Scaled and Cropped"),
                        'fillMode': Image.PreserveAspectCrop
                    },
                    {
                        'label': i18nd("plasma_applet_org.kde.image", "Scaled"),
                        'fillMode': Image.Stretch
                    },
                    {
                        'label': i18nd("plasma_applet_org.kde.image", "Scaled, Keep Proportions"),
                        'fillMode': Image.PreserveAspectFit
                    },
                    {
                        'label': i18nd("plasma_applet_org.kde.image", "Centered"),
                        'fillMode': Image.Pad
                    },
                    {
                        'label': i18nd("plasma_applet_org.kde.image", "Tiled"),
                        'fillMode': Image.Tile
                    }
                ]
                textRole: "label"
                property int fillMode: cfg_FillMode
                onFillModeChanged: {
                    for (var i = 0; i < model.length; i++) {
                        if (model[i].fillMode == fillMode) {
                            currentIndex = i;
                            break
                        }
                    }
                }
                onCurrentIndexChanged: cfg_FillMode = model[currentIndex].fillMode
                Layout.fillWidth: true
            }
        }
    }

    CheckBox {
        Layout.fillWidth: true

        text: "Smooth"
        onClicked: cfg_Smooth = checked;
    }

    Item {
        // Spacer
        Layout.fillHeight: true
    }

    FileDialog {
        id: fileDialog
        title: i18nd("plasma_applet_org.kde.gif", "Please choose an image")
        nameFilters: [ "Image files (*.jpg *.png *.gif)", "All files (*)" ]
        onAccepted: {
            cfg_Image = fileDialog.fileUrls[0]
        }
    }
}
