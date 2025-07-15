import Toybox.Graphics;
import Toybox.WatchUi;

class HighHRAlertView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.HighHRAlert(dc));
    }
}