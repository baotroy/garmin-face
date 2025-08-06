
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module Calories {

	function drawText(dc, value,cx, cy) {
         var fH = dc.getFontHeight(Utils.getSmallFont());
        var x = dc.getTextWidthInPixels(value, Utils.getSmallFont());

        dc.drawText(cx/2-x, cy/2 - fH/2, Utils.getSmallFont(), "9999", Gfx.TEXT_JUSTIFY_CENTER);
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}