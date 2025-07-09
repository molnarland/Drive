import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
using Toybox.Application;

class DriveDelegate extends WatchUi.BehaviorDelegate {

    private var controller as DriveController;

    function initialize() {
        BehaviorDelegate.initialize();

        controller = Application.getApp().controller;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new DriveMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    public function onKey(e) as Boolean {
        switch (e.getKey()) {
            case WatchUi.KEY_ENTER:
                var isRun = controller.startStop();
                if (!isRun) {
                    onMenu();
                }
                //WatchUi.requestUpdate();
                return true;
            case WatchUi.KEY_ESC:
                controller.lap();
                WatchUi.requestUpdate();
                return true;
            default:
                return false;
        }
    } 
}