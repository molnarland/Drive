using Toybox.Position;
using Toybox.ActivityRecording;
import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class DriveApp extends Application.AppBase {

    public var controller as DriveController;

    function initialize() {
        AppBase.initialize();
        
        controller = new DriveController();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new DriveView(), new DriveDelegate() ];
    }

}


function getApp() as DriveApp {
    return Application.getApp() as DriveApp;
}