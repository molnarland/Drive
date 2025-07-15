import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
using Toybox.Application;

class RestDelegate extends BaseDelegate {

    function initialize() {
        BaseDelegate.initialize();
    }

    protected function onEsc() as Boolean {
        WatchUi.pushView(new DriveView(), new DriveDelegate(), WatchUi.SLIDE_RIGHT);

        lap();

        return true;
    }
}