using Toybox.Timer;
import Toybox.Lang;

const MAX_TIME = 30 * 60;

class DriveTimer {
    private var _timer as Timer.Timer;
    private var _startTime as Number?;

    public function initialize() {
        _timer = new Timer.Timer();
        _startTime = null;
    }

    public function start() as Void {
        _timer.start(method(:requestUpdate), 1, true);
        _startTime = Time.now().value() - 59 * 60;   
    }

    public function stop() as Void {
        _timer.stop();
        _startTime = null;
    }

    public function getElapsedTime() as String {
        if (_startTime == null) {
            return "00:00";
        }
    
        var duration = Time.now().value() - (_startTime as Number);
        
        var minutes = duration / 60;

        if (minutes < 60) {
            var seconds = duration % 60;
            return minutes.format("%02d") + ":" + seconds.format("%02d");
        }

        var hours = minutes / 60;
        minutes = minutes % 60;

        return hours.format("%02d") + ":" + minutes.format("%02d");
    }

    public function requestUpdate() as Void {
        WatchUi.requestUpdate();
    }
}