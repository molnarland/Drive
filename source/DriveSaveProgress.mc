using Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Lang;

class DriveSaveProgress extends WatchUi.ProgressBar {
    public function initialize() {
        ProgressBar.initialize(
            WatchUi.loadResource($.Rez.Strings.progress_saving) as String,
            null
        );
    }
}