import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
using Toybox.Application;

class BaseDelegate extends WatchUi.BehaviorDelegate {

    private var _controller as DriveController;

    function initialize() {
        BehaviorDelegate.initialize();

        _controller = Application.getApp().controller;
    }

    public function onKey(e) as Boolean {
        switch (e.getKey()) {
            case WatchUi.KEY_ENTER:
                return onEnter();
            case WatchUi.KEY_ESC:
                return onEsc();
            default:
                return false;
        }
    } 


    private function onEnter() as Boolean {
        var isRun = _controller.startStop();
        if (!isRun) {
            onMenu();
            WatchUi.pushView(new Rez.Menus.MainMenu(), new DriveMenuDelegate(), WatchUi.SLIDE_UP);
        }

        return true;
    }

    protected function onEsc() as Boolean {
        return false;
    }

    protected function lap() as Void {
        _controller.lap();
    }
}