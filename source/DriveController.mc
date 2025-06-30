using Toybox.ActivityRecording;
using Toybox.Timer;
using Toybox.WatchUi;
using Toybox.Time;
using Toybox.Lang;
import Toybox.Activity;
import Toybox.Lang;

const MAX_DRIVE_TIME = 3 * 60 * 60;

class DriveController {
    private var _session as ActivityRecording.Session;
    private var _position as DrivePosition;
    private var _isRunning as Boolean;
    private var _timer as DriveTimer; 

    public function initialize() {
        _session = ActivityRecording.createSession({  // set up recording session
            :name=>"Drive",                               // set session name
            :sport=>Activity.SPORT_DRIVING,              // set sport type
            :subSport=>Activity.SUB_SPORT_MULTI_GAS_DIVING,       // set sub sport type
        });
        _position = new DrivePosition();
        _isRunning = false;
        _timer = new DriveTimer();
    }

    public function startStop() as Void {
        System.println(_session.isRecording());
        if (_session.isRecording()) {
            stop();
        } else {
            start();
        }
    }

    public function start() as Void {
        _session.start();
        _position.start();
        _timer.start();
        _isRunning = true;
    }

    public function stop() as Void {
        _session.stop();
        _session.save();
        _timer.stop();
        _isRunning = false;
    }

    public function onExit() as Void {
        System.exit();
    }

    public function getIsRunning() as Boolean {
        return _isRunning;
    }

    public function getElapsedTime() as String {
        return _timer.getElapsedTime();
    }
}
