using Toybox.ActivityRecording;
using Toybox.ActivityMonitor;
using Toybox.Timer;
using Toybox.WatchUi;
using Toybox.Time;
using Toybox.Lang;
using Toybox.System;
import Toybox.FitContributor;
import Toybox.Activity;
import Toybox.Lang;
import Toybox.Sensor;


class DriveController {
    private var _session as ActivityRecording.Session?;
    private var _dataField as FitContributor.Field?;

    private var _position as DrivePosition;
    private var _status as Number;
    private var _timer as DriveTimer; 
    private var _clockTime as System.ClockTime;

    private var _hr as Number;
    private var _speed as Float;

    private var _isRest as Boolean;

    public function initialize() {
        _session = null;
        _dataField = null;
        _position = new DrivePosition();
        _status = DriveStatus.STOPPED;
        _timer = new DriveTimer();
        _clockTime = System.getClockTime();
        _hr = 0;
        _speed = 0.0;
        _isRest = false;
        enableSensors();
    }

    private function enableSensors() as Void {
        Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
        Sensor.enableSensorEvents(method(:onSensor));
    }

    private function createSession() as Void {
        _session = ActivityRecording.createSession({
            :name=>"Drive",
            :sport=>Activity.SPORT_DRIVING,
            :subSport=>Activity.SUB_SPORT_MULTI_GAS_DIVING,
        });
    }

    public function startStop() as Boolean {
        if (_session instanceof ActivityRecording.Session && _session.isRecording()) {
            stop();
            return false;
        } else {
            start();
            return true;
        }
    }

    public function start() as Void {
        createSession();
        if (_session instanceof ActivityRecording.Session) {
            _session.start();
        }
        _position.start();
        _timer.start();
        _status = DriveStatus.RUNNING;
    }

    public function stop() as Void {
        _position.stop();
        _timer.pause();
        _status = DriveStatus.STOPPED;
    }

    public function lap() as Void {
        if (_session instanceof ActivityRecording.Session && _session.isRecording()) {
            _session.addLap();
            _isRest = !_isRest;
            _timer.stop();
            _timer.start();
            _timer.setRest(_isRest);
            if (_dataField != null) {
                _dataField.setData(_isRest ? "Rest" : "Drive");
                }
        } else {
            System.println("No active session to lap.");
        }
    }

    public function resume() as Void {
        if (_session instanceof ActivityRecording.Session && !_session.isRecording()) {
            _session.start();

        } 
        _position.start();
        _timer.resume();
        _status = DriveStatus.RUNNING;
    }

    public function save() as Void {
        if (_session instanceof ActivityRecording.Session) {
            _session.stop();
        }

        if (_session instanceof ActivityRecording.Session) {
            _session.save();
        }

        WatchUi.switchToView(new DriveSaveProgress(), new DriveProgressDelegate(), WatchUi.SLIDE_UP);
        (new Timer.Timer()).start(method(:onExit), 3000, false);
    }

    public function discard() as Void {
        if (_session instanceof ActivityRecording.Session) {
            _session.stop();
        }

        if (_session instanceof ActivityRecording.Session) {
            _session.discard();
        }

        WatchUi.switchToView(new DriveDiscardProgress(), new DriveProgressDelegate(), WatchUi.SLIDE_UP);
        (new Timer.Timer()).start(method(:onExit), 3000, false);
    }

    public function onExit() as Void {
        _session = null;
        System.exit();
    }

    public function getIsRunning() as Boolean {
        return _status == DriveStatus.RUNNING;
    }

    public function getElapsedTime() as String {
        return _timer.getElapsedTime();
    }

    public function getHR() as Number {
        return _hr;
    }

    public function getSpeed() as Number {
        if (_speed == null) {
            return 0;
        }

        return (_speed * 3.6).toNumber(); // Convert m/s to km/h
    }

    public function getClockTime() as String {
        return _clockTime.hour.format("%02d")  + ":" + _clockTime.min.format("%02d");
    }

    public function onSensor(sensorInfo as Sensor.Info) as Void {
        _hr = sensorInfo.heartRate instanceof Number ? sensorInfo.heartRate as Number : 0 ;
        _speed = sensorInfo.speed instanceof Float ? sensorInfo.speed as Float : 0.0 ;
    }
}
