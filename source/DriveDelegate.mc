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
        if (e.getKey() == WatchUi.KEY_ENTER) {
            controller.startStop();
            WatchUi.requestUpdate();
            return true;
        }

        return false;
    }

    function onNextMode() as Boolean {
        controller.startStop();
        return true;
    }
}