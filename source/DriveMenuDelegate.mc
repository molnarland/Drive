import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class DriveMenuDelegate extends WatchUi.MenuInputDelegate {

    private var _controller as DriveController;

    function initialize() {
        MenuInputDelegate.initialize();
        _controller = Application.getApp().controller;
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :resume) {
            _controller.resume();
        } else if (item == :save) {
            _controller.save();
        }
        else if (item == :discard) {
            _controller.discard();
        } 
    }
}