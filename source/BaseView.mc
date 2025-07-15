import Toybox.Graphics;
import Toybox.WatchUi;

class BaseView extends WatchUi.View {

    private var _controller as DriveController;

    function initialize() {
        View.initialize();

        _controller = Application.getApp().controller;
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var timeDrawable = findDrawableById("DriveTime");
        var hrDrawable = findDrawableById("DriveHR");
        var speedDrawable = findDrawableById("DriveSpeed");
        var clockTimeDrawable = findDrawableById("DriveClockTime");

        if (timeDrawable instanceof Text) {
            timeDrawable.setText(_controller.getElapsedTime().toString());
        }
        
        if (hrDrawable instanceof Text) {
            hrDrawable.setText(_controller.getHR().toString() + "bpm");
        }

        if (speedDrawable instanceof Text) {
            speedDrawable.setText(_controller.getSpeed().toString() + "km/h");
        }

        if (clockTimeDrawable instanceof Text) {
            clockTimeDrawable.setText(_controller.getClockTime());
        }

        View.onUpdate(dc);
    }

}
