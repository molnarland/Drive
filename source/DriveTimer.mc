using Toybox.Timer;
using Toybox.Attention;
using Toybox.WatchUi;
import Toybox.System;
import Toybox.Graphics;
import Toybox.Lang;

const MAX_DRIVE_TIME = 1;
const MAX_REST_TIME = 1;

class DriveTimer extends BaseTimer {
    private var _isRest as Boolean;
    private var _alertTimer as AlertTimer;

    public function initialize() {
        BaseTimer.initialize();

        _isRest = false;
        _alertTimer = new AlertTimer(method(:stopAlert));
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
        var duration = getDuration();
        var limit = _isRest ? MAX_REST_TIME : MAX_DRIVE_TIME;

        if (duration == limit * 60) {
            doVibrate();
            startAlert();
        }

        WatchUi.requestUpdate();
    }

    public function startAlert() as Void {
        var alertView = _isRest ? new RestAlertView() : new DriveAlertView();
        WatchUi.pushView(alertView, new AlertDelegate(), WatchUi.SLIDE_UP);
        _alertTimer.start();
    }

    public function stopAlert() as Void {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }

    public function setRest(isRest as Boolean) as Void {
        _isRest = isRest;
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