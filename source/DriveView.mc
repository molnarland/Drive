import Toybox.Graphics;

class DriveView extends BaseView {

    function initialize() {
        BaseView.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.DriveLayout(dc));
    }

}
