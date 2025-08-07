
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module Battery {

	function drawText(dc, value, cx, cy, font, fontHeight) {
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
        // var fH = dc.getFontHeight(Utils.getSmallFont());
        // var x = dc.getTextWidthInPixels(value, Utils.getSmallFont());
        dc.drawText(cx, cy *2-fontHeight, font, value + "%", Gfx.TEXT_JUSTIFY_CENTER);
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}