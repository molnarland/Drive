using Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class DriveDiscardProgress extends WatchUi.ProgressBar {
    public function initialize() {
        ProgressBar.initialize(
            WatchUi.loadResource($.Rez.Strings.progress_discarding) as String,
            null
        );
    }
}