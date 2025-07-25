import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
using Toybox.Application;

class DriveDelegate extends BaseDelegate {

    function initialize() {
        BaseDelegate.initialize();
    }

    protected function onEsc() as Boolean {
        WatchUi.pushView(new RestView(), new RestDelegate(), WatchUi.SLIDE_RIGHT);

        lap();

        return true;
    }
}