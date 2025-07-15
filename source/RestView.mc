import Toybox.Graphics;

class RestView extends BaseView {

    function initialize() {
        BaseView.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.RestLayout(dc));
    }
}

