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

        Mycroft.DynamicLabel {
            id: maxTemp
            font.weight: Font.Bold
            proportionalSize: root.width * 0.8
            text: sessionData.max + "°"
        }
        Item {
            height: Kirigami.Units.largeSpacing * 10
        }
        Mycroft.DynamicLabel {
            id: minTemp
            font.styleName: "Thin"
            proportionalSize: root.width * 0.8
            text: sessionData.min + "°"
        }
    }
}
