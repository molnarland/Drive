using Toybox.Timer;
import Toybox.Time;
import Toybox.Lang;

class BaseTimer {
    protected var _timer as Timer.Timer;
    protected var _startTime as Time.Moment?;

    public function initialize() {
        _timer = new Timer.Timer();
        _startTime = null;
    }

    public function start() as Void {
        _timer.start(method(:requestUpdate), 1000, true);
        _startTime = Time.now() /*- 59 * 60*/;   
    }

    public function stop() as Void {
        _timer.stop();
        _startTime = null;
    }

    public function resume() as Void {
        _timer.start(method(:requestUpdate), 1000, true);
    }

    public function pause() as Void {
        _timer.stop();
    }


    public function requestUpdate() as Void {
    }

    protected function getDuration() as Number {
        if (_startTime == null) {
            return 0;
        }
        
        return Time.now().subtract(_startTime as Time.Moment).value();
    }

    protected function getMinutes(duration as Number?) as Number {
        if (duration == null) {
            duration = getDuration();
        }

        return duration / 60;
    }
}