import QtQuick 2.15
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.1 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasma5support 2.0 as Plasma5Support

PlasmoidItem {
    id: root

    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    implicitWidth: 140
    implicitHeight: 40

    property string displayText: "…"

    FontLoader {
        id: quicksand
        source: "../fonts/Quicksand-Regular.otf"
    }

    function refresh() {
        execSource.connectedSources = [
            "sensors | awk '/Package id 0:/ {gsub(/\\+/, \"\", $4); print $4; exit} /Tctl:/ {gsub(/\\+/, \"\", $2); print $2; exit} /Tdie:/ {gsub(/\\+/, \"\", $2); print $2; exit}'"
        ]
    }

    Plasma5Support.DataSource {
        id: execSource
        engine: "executable"

        onNewData: function(sourceName, data) {
            root.displayText = "CPU Temp:\n" + (data["stdout"] || "").trim()
            disconnectSource(sourceName)
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.refresh()
    }

    Component.onCompleted: root.refresh()

    PlasmaComponents.Label {
        anchors.centerIn: parent
        text: root.displayText

        color: "#ffffff"
        font.family: quicksand.name
        font.pixelSize: root.height * 0.35
        renderType: Text.NativeRendering
    }
}
