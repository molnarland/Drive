using Toybox.ActivityRecording;
import Toybox.Activity;
import Toybox.Lang;

class DriveController {
    private var _session as ActivityRecording.Session;
    private var _isRunning as Boolean;

    public function initialize() {
        _session = ActivityRecording.createSession({  // set up recording session
            :name=>"Drive",                               // set session name
            :sport=>Activity.SPORT_DRIVING,              // set sport type
            :subSport=>Activity.SUB_SPORT_MULTI_GAS_DIVING,       // set sub sport type
        });
        _isRunning = false;
    }

    public function startStop() as Void {
        if (_isRunning) {
            stop();
        } else {
            start();
        }
    }

    public function start() as Void {
        _session.start();
        _isRunning = true;
    }

    public function stop() as Void {
        _session.stop();
        _isRunning = false;
    }

    public function onExit() as Void {
        System.exit();
    }

    public function getIsRunning() as Boolean {
        return _isRunning;
    }
}
