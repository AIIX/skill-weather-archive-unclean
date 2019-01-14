import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

WeatherDelegate {
    id: highlowRoot

    ColumnLayout {
        id: grid
        Layout.fillWidth: true
        spacing: 0

        Mycroft.AutoFitLabel {
            id: maxTemp
            Layout.fillWidth: true
            Layout.preferredHeight: proportionalGridUnit * 3
            font.weight: Font.Bold
            text: sessionData.max + "°"
        }
        Item {
            height: Kirigami.Units.largeSpacing * 10
        }
        Mycroft.AutoFitLabel {
            id: minTemp
            Layout.fillWidth: true
            Layout.preferredHeight: proportionalGridUnit * 3
            font.styleName: "Thin"
            text: sessionData.min + "°"
        }
    }
}
