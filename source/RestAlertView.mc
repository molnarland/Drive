import Toybox.Graphics;
import Toybox.WatchUi;

class RestAlertView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.RestAlert(dc));
    }
}