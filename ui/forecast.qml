import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

WeatherDelegate {
    id: root

    ColumnLayout {
        Layout.fillWidth: true
        anchors.centerIn: parent
        spacing: Kirigami.Units.largeSpacing * 5

        Repeater {
            id: forecastRepeater
            model: sessionData.forecast.first
            delegate: GridLayout {
                columns: 2
                Layout.fillWidth: true
                LottieAnimation {
                    Layout.preferredHeight: Kirigami.Units.gridUnit * 7
                    Layout.maximumWidth: Kirigami.Units.gridUnit * 15
                    source: Qt.resolvedUrl(getWeatherImagery(modelData.weathercode))
                    loops: Animation.Infinite
                    fillMode: Image.PreserveAspectFit
                    running: true
                }
                Mycroft.AutoFitLabel {
                    font.weight: Font.Bold
                    Layout.preferredWidth: parent.width * 0.6
                    Layout.preferredHeight: parent.height * 0.2
                }

                Mycroft.AutoFitLabel {
                    font.weight: Font.Bold
                    text: modelData.max + "°"
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    font.capitalization: Font.AllUppercase
                    font.family: "Noto Sans Display"
                    font.styleName: "Thin"
                    font.pixelSize: 140
                    color: "white"
                    lineHeight: 0.6
                    text: modelData.min + "°"
                }
            }
        }
        Item {
            height: Kirigami.Units.largeSpacing * 10
        }
    }
}
