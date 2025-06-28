import Toybox.Graphics;
import Toybox.WatchUi;

class DriveView extends WatchUi.View {

    private var controller as DriveController;

    function initialize() {
        View.initialize();

        controller = Application.getApp().controller;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        if (controller.getIsRunning()) {
            (findDrawableById("MainLabel") as Text).setText("running");
        }
        else {
            (findDrawableById("MainLabel") as Text).setText("not running");
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
