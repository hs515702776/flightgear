import QtQuick 2.4
import FlightGear.Launcher 1.0
import "."

Item {
    id: root

    signal select(var uri);
    signal showDetails(var uri)

    readonly property bool __isSelected: (_launcher.selectedAircraft === model.uri)

    Rectangle {
        anchors.centerIn: parent
        width: parent.width - 4
        height: parent.height - 4
        color: "transparent"
        border.width: 1
        border.color: "#dfdfdf"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            if (__isSelected) {
                root.showDetails(model.uri)
            } else {
                root.select(model.uri)
            }
        }
    }

    Column {
        id: contentBox
        width: parent.width
        y: Style.margin
        spacing: 2 //

        Item {
            id: thumbnailBox
            width: 172
            height: 128
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                anchors.centerIn: parent
                border.width: 1
                border.color: "#7f7f7f"
                width: thumbnail.width
                height: thumbnail.height

                ThumbnailImage {
                    id: thumbnail
                    aircraftUri: model.uri
                    maximumSize.width: 172
                    maximumSize.height: 128
                }
            }

            Button {
                visible: hover.containsMouse && (model.packageStatus === LocalAircraftCache.PackageNotInstalled)
                text: qsTr("Install")
                onClicked: {
                    // drill down and also start the install
                    _launcher.requestInstallUpdate(model.uri)
                    root.showDetails(model.uri)
                }
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                }
            }
        }

        AircraftVariantChoice {
            id: titleBox

            width: parent.width
            popupFontPixelSize: Style.baseFontPixelSize
            aircraft: model.uri;
            currentIndex: model.activeVariant
            onSelected: {
                model.activeVariant = index
                root.select(model.uri)
            }
        }
    }

    MouseArea {
        id: hover
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
    }
} // of root item
