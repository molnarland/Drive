import Toybox.Graphics;
import Toybox.WatchUi;

class DriveAlertView extends WatchUi.View {
    function initialize() {
        View.initialize();

        // _controller = Application.getApp().controller;
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.DriveAlert(dc));
    }
}