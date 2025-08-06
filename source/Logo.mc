
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module Logo {

	function drawText(dc, cx, cy) {
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);

        
     //    var fH = dc.getFontHeight(Utils.getSmallFont());
     //    var x = dc.getTextWidthInPixels(hStr, Utils.getSmallFont());

        dc.drawText(cx, 0, Utils.getSmallFont(), ";", Gfx.TEXT_JUSTIFY_CENTER);     
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}