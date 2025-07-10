using Toybox.Timer;
import Toybox.Lang;

const ALERT_TIME = 1;

typedef OnStopAlert as Method() as Void;

class AlertTimer extends BaseTimer {
    private var _onStopAlert as OnStopAlert;

    public function initialize(onStopAlert as OnStopAlert) {
        BaseTimer.initialize();

        _onStopAlert = onStopAlert;
    }

    public function requestUpdate() as Void {
        if (getDuration() == ALERT_TIME * 60) {
            _onStopAlert.invoke();
        }
    }
}