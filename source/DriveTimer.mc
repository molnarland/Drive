using Toybox.Timer;
using Toybox.Attention;
import Toybox.Lang;

const MAX_DRIVE_TIME = 30 * 60;
const MAX_REST_TIME = 10;

class DriveTimer {
    private var _timer as Timer.Timer;
    private var _startTime as Number?;
    private var _isRest as Boolean;

    public function initialize() {
        _timer = new Timer.Timer();
        _startTime = null;
        _isRest = false;
    }

    public function start() as Void {
        _timer.start(method(:requestUpdate), 1000, true);
        _startTime = Time.now().value() /*- 59 * 60*/;   
    }

    public function resume() as Void {
        _timer.start(method(:requestUpdate), 1000, true);
    }

    public function pause() as Void {
        _timer.stop();
    }

    public function stop() as Void {
        _timer.stop();
        _startTime = null;
    }

    public function getElapsedTime() as String {
        if (_startTime == null) {
            return "00:00";
        }
    
        var duration = getDuration();
        var minutes = getMinutes(duration);

        if (minutes < 60) {
            var seconds = duration % 60;
            return minutes.format("%02d") + ":" + seconds.format("%02d");
        }

        var hours = minutes / 60;
        minutes = minutes % 60;

        return hours.format("%02d") + ":" + minutes.format("%02d");
    }

    public function requestUpdate() as Void {
        var minutes = getMinutes(null);
        if (_isRest) {
            if (minutes >= MAX_REST_TIME) {
                doVibrate();
            }
        } else {
            if (minutes >= MAX_DRIVE_TIME) {
                doVibrate();
            }
        }

        WatchUi.requestUpdate();
    }

    public function setRest(isRest as Boolean) as Void {
        _isRest = isRest;
    }

    private function getDuration() as Number {
        if (_startTime == null) {
            return 0;
        }
        
        return Time.now().value() - (_startTime as Number);
    }

    private function getMinutes(duration as Number?) as Number {
        if (duration == null) {
            duration = getDuration();
        }

        return duration / 60;
    }

    private function doVibrate() as Void {
        if (Attention has :vibrate) {
            Attention.vibrate([
                new Attention.VibeProfile(50, 2000), // On for two seconds
                new Attention.VibeProfile(0, 2000),  // Off for two seconds
                new Attention.VibeProfile(50, 2000), // On for two seconds
                new Attention.VibeProfile(0, 2000),  // Off for two seconds
                new Attention.VibeProfile(50, 2000)  // on for two seconds
            ]);
        }
    }
}