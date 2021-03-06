import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft

Mycroft.PaginatedDelegate {
    id: root
    property alias location: locationHeading.text
    property var current
    property var min
    property var max
    property var condition
    property var weathercode
    property var forecastDump
    graceTime: 30000
    backgroundImage: getWeatherImagery(weathercode)[1]

    function getWeatherImagery(weathercode){
        switch(weathercode) {
        case 0:
            return ["icons/day.svg", "https://source.unsplash.com/1920x1080/?+sky"]
            break
        case 1:
            return ["icons/cloudy-day-2.svg", "https://source.unsplash.com/1920x1080/?+scatteredclouds"]
            break
        case 2:
            return ["icons/cloudy.svg", "https://source.unsplash.com/1920x1080/?+cloudy"]
            break
        case 3:
            return ["icons/rainy-2.svg", "https://source.unsplash.com/1920x1080/?+rain"]
            break
        case 4:
            return ["icons/rainy-1.svg", "https://source.unsplash.com/1920x1080/?+rains"]
            break
        case 5:
            return ["icons/thunder.svg", "https://source.unsplash.com/1920x1080/?+storm"]
            break
        case 6:
            return ["icons/snowy-6.svg", "https://source.unsplash.com/1920x1080/?+snow"]
            break
        case 7:
            return ["icons/haze.svg", "https://source.unsplash.com/1920x1080/?+mist"]
            break
        }
    }

    function getForecastImagery(weathercode){
        switch(weathercode) {
        case 0:
            return "icons/day.svg"
            break
        case 1:
            return "icons/cloudy-day-2.svg"
            break
        case 2:
            return "icons/cloudy.svg"
            break
        case 3:
            return "icons/rainy-2.svg"
            break
        case 4:
            return "icons/rainy-1.svg"
            break
        case 5:
            return "icons/thunder.svg"
            break
        case 6:
            return "icons/snowy-6.svg"
            break
        case 7:
            return "icons/haze.svg"
            break
        }
    }

    //Page 1
    Kirigami.Page {
        ColumnLayout{
            Item {
                Layout.fillWidth: true
                height: Kirigami.Units.smallSpacing + Kirigami.Units.largeSpacing
            }
            Kirigami.Heading {
                id: locationHeading
                Layout.alignment: Qt.AlignHCenter
                level: 2
                wrapMode: Text.WordWrap
            }

            Kirigami.Heading {
                id: contentcondition
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                level: 2
                font.capitalization: Font.SmallCaps
                font.italic: true
                height: contentLow.height
                text: condition
            }

            RowLayout {
                id: row
                Layout.fillWidth: true
                spacing: Kirigami.Units.largeSpacing
                Image {
                    id: img
                    fillMode: Image.PreserveAspectFit
                    Layout.preferredWidth: Kirigami.Units.gridUnit * 5
                    Layout.preferredHeight: Kirigami.Units.gridUnit * 5
                    source: getWeatherImagery(weathercode)[0]
                }
                Kirigami.Heading {
                    id: titleCurrent
                    level: 1
                    wrapMode: Text.WordWrap
                    font.bold: true
                    text: current + "°"
                }

                Kirigami.FormLayout {
                    id: form
                    Layout.fillWidth: true
                    Layout.minimumWidth: implicitWidth

                    Kirigami.Heading {
                        id: contentLow
                        Kirigami.FormData.label: "Low:"
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        level: 3
                        text: min + "°"
                    }
                    Kirigami.Heading {
                        id: contenthigh
                        Kirigami.FormData.label: "High:"
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        level: 3
                        text: max + "°"
                    }
                }
            }
        }
    }

    //Page 2
    Kirigami.ScrollablePage{

        Kirigami.CardsLayout {
            Layout.fillWidth: true
            maximumColumnWidth: Kirigami.Units.gridUnit * 12

            Repeater {
                id: forecastRepeater
                model: forecastDump.forecast
                delegate:
                    Column {
                    spacing: Kirigami.Units.largeSpacing

                    Kirigami.Heading{
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        level: 2
                        text: modelData.date
                        Layout.fillWidth: true
                    }
                    Row {
                        Layout.fillWidth: true
                        spacing: Kirigami.Units.smallSpacing

                        Image {
                            fillMode: Image.PreserveAspectFit
                            Layout.preferredWidth: Kirigami.Units.gridUnit * 6
                            Layout.preferredHeight: Kirigami.Units.gridUnit * 6
                            source: getForecastImagery(modelData.weathercode)
                        }

                        Kirigami.FormLayout {
                            Layout.fillWidth: true
                            Kirigami.Heading {
                                wrapMode: Text.WordWrap
                                Kirigami.FormData.label: "Low:"
                                elide: Text.ElideRight
                                level: 3
                                text: modelData.min + "°"
                            }
                            Kirigami.Heading {
                                wrapMode: Text.WordWrap
                                Kirigami.FormData.label: "High:"
                                elide: Text.ElideRight
                                level: 3
                                text: modelData.max + "°"
                            }
                        }
                    }
                }
            }
        }
    }
}
