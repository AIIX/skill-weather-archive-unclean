import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

Mycroft.Delegate {
    id: root

    ColumnLayout {
        id: grid
        Layout.fillWidth: true
        anchors.centerIn: parent
        spacing: 0

        Mycroft.AutoFitLabel {
            id: maxTemp
            font.weight: Font.Bold
            text: sessionData.max + "°"
        }
        Item {
            height: Kirigami.Units.largeSpacing * 10
        }
        Mycroft.AutoFitLabel {
            id: minTemp
            font.styleName: "Thin"
            text: sessionData.min + "°"
        }
    }
}
