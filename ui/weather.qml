import QtQuick.Layouts 1.4
import QtQuick 2.4
import QtQuick.Controls 2.0
import org.kde.kirigami 2.4 as Kirigami

import Mycroft 1.0 as Mycroft
import org.kde.lottie 1.0

Mycroft.Delegate {
    id: root

    function getWeatherImagery(weathercode){
        switch(weathercode) {
        case 0:
            return "animations/sunny.json";
            break
        case 1:
            return "animations/partlycloudy.json";
            break
        case 2:
            return "animations/cloudy.json";
            break
        case 3:
            return "animations/rain.json";
            break
        case 4:
            return "animations/rain.json";
            break
        case 5:
            return "animations/storm.json";
            break
        case 6:
            return "animations/snow.json";
            break
        case 7:
            return "animations/fog.json";
            break
        }
    }

    ColumnLayout {
        id: grid
        Layout.fillWidth: true
        anchors.centerIn: parent
        spacing: 0
        LottieAnimation {
            id: weatherAnimation
            Layout.preferredWidth: Kirigami.Units.gridUnit * 14
            Layout.preferredHeight: Kirigami.Units.gridUnit * 14
            source: Qt.resolvedUrl(getWeatherImagery(sessionData.weathercode))

            loops: Animation.Infinite
            fillMode: Image.PreserveAspectFit
            running: true

            // Debug:
            onSourceChanged: {
                console.log(getWeatherImagery(sessionData.weathercode));
            }
            onStatusChanged: {
                console.log(weatherAnimation.status, errorString);
            }
        }
        Item {
            height: Kirigami.Units.largeSpacing * 10
        }
        Mycroft.DynamicLabel {
            id: temperature
            font.weight: Font.Bold
            Layout.fillWidth: true
            Layout.preferredHeight: root.height * 0.4
            text: sessionData.current + "°"
        }
    }
}
