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
        (findDrawableById("DriveTime") as Text).setText(_controller.getElapsedTime());

        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
