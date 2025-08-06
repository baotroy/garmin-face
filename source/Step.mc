
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module Step {

	function drawText(dc, value, cx, cy) {       
        var fH = dc.getFontHeight(Utils.getSmallFont());
        var x = dc.getTextWidthInPixels(value, Utils.getSmallFont());

        dc.drawText(cx/2-x, cy + 3*fH/4, Utils.getSmallFont(), value, Gfx.TEXT_JUSTIFY_CENTER);
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}