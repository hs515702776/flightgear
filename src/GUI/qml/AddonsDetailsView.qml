import QtQuick 2.4
import FlightGear.Launcher 1.0
import "."

Rectangle {
    id: root
    color: "white"
    property int mdx: 0
    signal goBack()

    MouseArea {
        // consume all mouse-clicks on the detail view
        anchors.fill: parent
    }

    Flickable
    {
        id: flickable

        anchors.fill: parent
        contentWidth: parent.width
        contentHeight: content.childrenRect.height
        boundsBehavior: Flickable.StopAtBounds

        function labelText(lbl, idx, key) {
            var value = _addOns.modules.get(idx, key);
            if (typeof value === 'object') {
                value = Object.keys(value).map(function(key) { return value[key]; }).join(', ');
            }
            return qsTr("%1: %2").arg(lbl).arg(value);
        }
        function getMeta(idx, key) {
            return _addOns.modules.get(idx, key);
        }


        Item {
            id: content
            width: root.width - scrollbar.width
            height: childrenRect.height

            Column {
                id: columnTop
                width: content.width - (Style.margin * 2)
                spacing: Style.margin
                anchors.horizontalCenter: parent.horizontalCenter

                // description + authors container
                Item {
                    width: parent.width
                    height: childrenRect.height

                    Column {
                        id: column
                        anchors.left: parent.left
                        anchors.leftMargin: Style.margin
                        anchors.right: parent.right
                        spacing: Style.margin

                        StyledText {
                            id: addonName
                            text: flickable.labelText("Module", mdx, "name");
                            width: parent.width
                            wrapMode: Text.WordWrap
                            visible: flickable.getMeta(mdx, "name") != ""
                        }

                        StyledText {
                            id: addonDescription
                            text: flickable.labelText("Description", mdx, "long_description");
                            width: parent.width
                            wrapMode: Text.WordWrap
                            visible: flickable.getMeta(mdx, "long_description") != ""
                        }

                        StyledText {
                            id: addonId
                            text: flickable.labelText("Id", mdx, "id");
                            width: parent.width
                            wrapMode: Text.WordWrap
                            visible: flickable.getMeta(mdx, "id") != ""
                        }

                        StyledText {
                            id: addonVersion
                            text: flickable.labelText("Version", mdx, "version");
                            width: parent.width
                            wrapMode: Text.WordWrap
                            visible: flickable.getMeta(mdx, "version") != ""
                        }

                        StyledText {
                            id: minFgVersion
                            text: flickable.labelText("Min FG Version", mdx, "minversion_fg");
                            width: parent.width
                            wrapMode: Text.WordWrap
                            visible: flickable.getMeta(mdx, "minversion_fg") != ""
                        }

                        StyledText {
                            id: maxFgVersion
                            text: flickable.labelText("Max FG Version", mdx, "maxversion_fg");
                            width: parent.width
                            wrapMode: Text.WordWrap
                            visible: flickable.getMeta(mdx, "maxversion_fg") != ""
                        }

                        StyledText {
                            id: addonAuthors
                            text: flickable.labelText("Authors", mdx, "authors");
                            width: parent.width
                            anchors.horizontalCenter: parent.horizontalCenter
                            wrapMode: Text.WordWrap
                            visible: (flickable.getMeta(mdx, "authors") != undefined)
                        }

                        StyledText {
                            id: addonMaintainers
                            text: flickable.labelText("Maintainers", mdx, "maintainers");
                            width: parent.width
                            anchors.horizontalCenter: parent.horizontalCenter
                            wrapMode: Text.WordWrap
                            visible: (flickable.getMeta(mdx, "maintainers") != undefined)
                        }
                    }

                } // end of Item

                // web-links row
                Row {
                    id: weblinks
                    width: parent.width
                    height: childrenRect.height
                    spacing: Style.margin

                    Weblink {
                        visible: flickable.getMeta(mdx, "homepage") != ""
                        label: qsTr("Website")
                        link: flickable.getMeta(mdx, "homepage") || ""
                    }

                    Weblink {
                        visible: flickable.getMeta(mdx, "support_url") != ""
                        label: qsTr("Support and issue reporting")
                        link: flickable.getMeta(mdx, "support_url") || ""
                    }

                    Weblink {
                        visible: flickable.getMeta(mdx, "download_url") != ""
                        label: qsTr("Download")
                        link: flickable.getMeta(mdx, "download_url") || ""
                    }
                 }

                ClickableText {
                    id: pathLabel
                    text: flickable.labelText("Local file location", mdx, "path");
                    onClicked: {
                        // open the location
                        _addOns.openDirectory(flickable.getMeta(mdx, "path"))
                    }
                    // anchors.top: weblinks.bottom
                    anchors.left: parent.left
                    width: parent.width
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    visible: flickable.getMeta(mdx, "path") != undefined
                }

                Text {
                    height: 50
                    text: " "
                }

                Button
                {
                    width: Style.strutSize
                    id: backButton
                    text: "< Back"
                    onClicked: root.goBack();
                }

            } // main layout column
        } // of main item

    } // of Flickable

} // of Rect
