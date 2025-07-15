import Toybox.Graphics;
import Toybox.WatchUi;

class DriveView extends WatchUi.View {

    private var _controller as DriveController;

    function initialize() {
        View.initialize();

        _controller = Application.getApp().controller;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.DriveLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        var timeDrawable = findDrawableById("DriveTime");
        var hrDrawable = findDrawableById("DriveHR");
        var speedDrawable = findDrawableById("DriveSpeed");
        var clockTimeDrawable = findDrawableById("DriveClockTime");
        var statusDrawable = findDrawableById("DriveStatus");

        var foregroundColor = _controller.getIsRest() ? Graphics.COLOR_BLACK : Graphics.COLOR_WHITE;
        var backgroundColor = _controller.getIsRest() ? Graphics.COLOR_WHITE : Graphics.COLOR_BLACK;

        System.println(_controller.getIsRest() + " " + foregroundColor + " " + backgroundColor + " " + _controller.getRestStatus());

        dc.setColor(foregroundColor, backgroundColor);

        if (timeDrawable instanceof Text) {
            timeDrawable.setText(_controller.getElapsedTime().toString());
            // timeDrawable.setColor(foregroundColor);
        }
        
        if (hrDrawable instanceof Text) {
            hrDrawable.setText(_controller.getHR().toString() + "bpm");
            //hrDrawable.setColor(foregroundColor);
        }

        if (speedDrawable instanceof Text) {
            speedDrawable.setText(_controller.getSpeed().toString() + "km/h");
            // speedDrawable.setColor(foregroundColor);
        }

        if (clockTimeDrawable instanceof Text) {
            clockTimeDrawable.setText(_controller.getClockTime());
            // clockTimeDrawable.setColor(foregroundColor);
        }

        if (statusDrawable instanceof Text) {
            statusDrawable.setText(_controller.getRestStatus());
            // statusDrawable.setColor(foregroundColor);
            
        }

        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
