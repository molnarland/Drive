import Toybox.WatchUi;
import Toybox.Lang;

class AlertDelegate extends WatchUi.BehaviorDelegate {

    private var _controller as DriveController;

    function initialize() {
        BehaviorDelegate.initialize();

        _controller = Application.getApp().controller;
    }

    public function onKey(e) as Boolean {
        switch (e.getKey()) {
            case WatchUi.KEY_ESC:
                return onEsc();
            default:
                return false;
        }
    }

    private function onEsc() as Boolean {
        _controller.lap();
        WatchUi.popView(WatchUi.SLIDE_DOWN);
        return true;
    }
}