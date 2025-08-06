
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module HeartRate {

	function drawText(dc, cx, cy) {
        var heart_rate = 666;
        
        var hrIter = Act.getHeartRateHistory(null, true);
        if(hrIter != null){
            var hr = hrIter.next();
            heart_rate = (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
        }
        System.print("Heart Rate: " + heart_rate);
        //heart_rate = 198;

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
        dc.drawText(cx/2, 3*cy/4,Utils.getSmallFont(), hStr, Gfx.TEXT_JUSTIFY_CENTER);
        // if (hStr.length() > 2) {
        //     coordY = cy - fH + 10;
        // }
        // for( var i = 0; i < hStr.length(); i++ ) {
        //     var char = hStr.substring(i, i + 1);
        //     System.print("Drawing char: " + char);
        //     System.print("Drawing cx: " + cx);
        //     System.print("Drawing coordY: " + coordY);
        //     dc.drawText(100, coordY, Utils.getSmallFont(), char, Gfx.TEXT_JUSTIFY_CENTER);
        //     coordY += fH - 5;
        // }
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}