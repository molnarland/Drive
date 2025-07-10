using Toybox.WatchUi;

class DriveProgressDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onBack() {
        return true;
    }

}