import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0
 
Mycroft.PaginatedDelegate {
    id: root
    property var location: sessionData.location
    property var current: sessionData.current
    property var min: sessionData.min
    property var max: sessionData.max
    property var condition: sessionData.condition
    property var weathercode: sessionData.weathercode
    property var forecastDump: sessionData.forecastDump
    property var temperature: sessionData.temperature
    //graceTime: 30000
    skillBackgroundSource: getWeatherImagery(weathercode)[1]

    function getWeatherImagery(weathercode){
        switch(weathercode) {
        case 0:
            return ["animations/sunny.json", "https://source.unsplash.com/1920x1080/?+sky"]
            break
        case 1:
            return ["animations/partlycloudy.json", "https://source.unsplash.com/1920x1080/?+scatteredclouds"]
            break
        case 2:
            return ["animations/cloudy.json", "https://source.unsplash.com/1920x1080/?+cloudy"]
            break
        case 3:
            return ["animations/rain.json", "https://source.unsplash.com/1920x1080/?+rain"]
            break
        case 4:
            return ["animations/rain.json", "https://source.unsplash.com/1920x1080/?+rains"]
            break
        case 5:
            return ["animations/storm.json", "https://source.unsplash.com/1920x1080/?+storm"]
            break
        case 6:
            return ["animations/snow.json", "https://source.unsplash.com/1920x1080/?+snow"]
            break
        case 7:
            return ["animations/fog.json", "https://source.unsplash.com/1920x1080/?+mist"]
            break
        }
    }

    function getForecastImagery(weathercode){
        switch(weathercode) {
        case 0:
            return "animations/sunny.json"
            break
        case 1:
            return "animations/partlycloudy.json"
            break
        case 2:
            return "animations/cloudy.json"
            break
        case 3:
            return "animations/rain.json"
            break
        case 4:
            return "animations/rain.json"
            break
        case 5:
            return "animations/storm.json"
            break
        case 6:
            return "animations/snow.json"
            break
        case 7:
            return "animations/fog.json"
            break
        }
    }

    //Page 1
    Kirigami.Page {
        ColumnLayout {
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
            }
            
            Kirigami.Heading {
                id: locationHeading
                Layout.fillWidth: true
                font.capitalization: Font.SmallCaps
                level: 2
                wrapMode: Text.WordWrap
                text: location
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
                text: temperature
            }

            RowLayout {
                id: row
                Layout.fillWidth: true
                spacing: Kirigami.Units.largeSpacing
                                
                LottieAnimation {
                    id: fancyAnimation
                    Layout.preferredWidth: Kirigami.Units.gridUnit * 14
                    Layout.preferredHeight: Kirigami.Units.gridUnit * 14
                    source: Qt.resolvedUrl(getWeatherImagery(weathercode)[0])
                    //source: Qt.resolvedUrl("animations/sunny.json")
                    loops: Animation.Infinite
                    fillMode: Image.PreserveAspectFit
                    running: true
                    
                    onSourceChanged: {
                        console.log(getWeatherImagery(weathercode)[0])
                    }
                
                    onStatusChanged: {
                        console.log(fancyAnimation.status, errorString)
                    }
                }

                Kirigami.Heading {
                    id: titleCurrent
                    level: 1
                    wrapMode: Text.WordWrap
                    font.bold: true
                    text: current + "°"
                }
            }
            
            Kirigami.FormLayout {
                id: form
                Layout.fillWidth: true
                Kirigami.Heading {
                    id: contentLow
                    Kirigami.FormData.label: "Low:"
                    Layout.fillWidth: true
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    level: 2
                    text: min + "°"
                }
                Kirigami.Heading {
                    id: contenthigh
                    Kirigami.FormData.label: "High:"
                    Layout.fillWidth: true
                    wrapMode: Text.WordWrap
                    elide: Text.ElideRight
                    level: 2
                    text: max + "°"
                }
            }
        }
    }
    
        //Page 2
    Kirigami.ScrollablePage {

        Kirigami.CardsLayout {
            Layout.fillWidth: true
            maximumColumnWidth: Kirigami.Units.gridUnit * 12
            Repeater {
                id: forecastRepeater
                model: forecastDump.forecast
                delegate: Column {
                    spacing: Kirigami.Units.largeSpacing

                    Kirigami.Heading {
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        level: 2
                        text: modelData.date
                        Layout.fillWidth: true
                    }
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: Kirigami.Units.smallSpacing

                        LottieAnimation {
                            Layout.preferredWidth: Kirigami.Units.gridUnit * 6
                            Layout.preferredHeight: Kirigami.Units.gridUnit * 6
                            source: Qt.resolvedUrl(getForecastImagery(modelData.weathercode))
                            loops: Animation.Infinite
                            fillMode: Image.PreserveAspectFit
                            running: true
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
