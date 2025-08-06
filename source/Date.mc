
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module Date {

	function drawText(dc, cx, cy) {
        var heart_rate = "--";
        
        var hrIter = Act.getHeartRateHistory(null, true);
        if(hrIter != null){
            var hr = hrIter.next();
            heart_rate = (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
        }
        if (heart_rate >= 100) {
             dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        }
        else if (heart_rate >= 80) {
             dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
        }
        else if (heart_rate >= 60) {
             dc.setColor(Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
        }
        else {
             dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        }

        var hStr = heart_rate.toString();

        
        var fH = dc.getFontHeight(Utils.getSmallFont());
        var x = dc.getTextWidthInPixels(hStr, Utils.getSmallFont());

        dc.drawText(cx*2-cx/2+x/2, cy + 3*fH/4, Utils.getSmallFont(), hStr, Gfx.TEXT_JUSTIFY_CENTER);     
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}