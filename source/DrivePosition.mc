import Toybox.Position;
import Toybox.System;

class DrivePosition {
    public function start() as Void {
        Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
        System.println("cucu");

    }

    public function onPosition(info as Info) as Void {
        var pos = info.position;
        if (pos instanceof Position.Location) {
            var loc = pos.toDegrees();
            System.println(loc[0]);
        }
    }
}