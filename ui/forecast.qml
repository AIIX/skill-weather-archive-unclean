import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

WeatherDelegate {
    id: forcastRoot

    ColumnLayout {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        spacing: Kirigami.Units.largeSpacing * 2

        Item {
            height: Kirigami.Units.largeSpacing * 2
        }
        
        Repeater {
            id: forecastRepeater
            model: sessionData.forecast.first
            delegate: ColumnLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                spacing: Kirigami.Units.smallSpacing * 0.2
                RowLayout {
                    id: forecastTopRow
                    Layout.fillWidth: true
                    LottieAnimation {
                        Layout.preferredHeight: proportionalGridUnit * 2
                        Layout.maximumWidth: proportionalGridUnit * 3
                        source: Qt.resolvedUrl(getWeatherImagery(modelData.weathercode))
                        Layout.alignment: Qt.AlignHCenter
                        loops: Animation.Infinite
                        fillMode: Image.PreserveAspectFit
                        running: true
                    }
                    
                    Item {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredHeight: proportionalGridUnit * 1
                        Mycroft.AutoFitLabel {
                            font.weight: Font.Bold
                            anchors.fill: parent
                            text: modelData.date
                        }
                    }
                }
                RowLayout{
                    Layout.fillWidth: true
                    Mycroft.AutoFitLabel {
                        font.weight: Font.Bold
                        Layout.fillWidth: true
                        Layout.preferredHeight: proportionalGridUnit * 2.5
                        text: modelData.max + "°"
                    }

                    Mycroft.AutoFitLabel {
                        font.weight: Font.Thin
                        Layout.fillWidth: true
                        Layout.preferredHeight: proportionalGridUnit * 2.5
                        text: modelData.min + "°"
                    }
                }
            }
        }
        Item {
            height: Kirigami.Units.largeSpacing * 10
        }
    }
}
