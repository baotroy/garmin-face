
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module HeartRate {

	function drawText(dc, heart_rate, cx, cy, font, fontHeight) {
     //    var heart_rate = "--";
        
     //    var hrIter = Act.getHeartRateHistory(null, true);
     //    if(hrIter != null){
     //        var hr = hrIter.next();
     //        heart_rate = (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
     //    }
     //    if (heart_rate >= 100) {
     //         dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
     //    }
     //    else if (heart_rate >= 80) {
     //         dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
     //    }
     //    else if (heart_rate >= 60) {
     //         dc.setColor(Gfx.COLOR_YELLOW, Gfx.COLOR_TRANSPARENT);
     //    }
     //    else {
     //         dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
     //    }

        var hStr = heart_rate.toString();

        // var x = dc.getTextWidthInPixels(hStr, font);

        dc.drawText(cx, cy + 3 * fontHeight / 4, font, hStr, Gfx.TEXT_JUSTIFY_CENTER);
        // draw icon
          if (hrON()) {
               dc.drawText(cx, cy + 2 * fontHeight / 3 + fontHeight, font, "H", Gfx.TEXT_JUSTIFY_CENTER);
          }
	}
    
    function hrON() {
        return Act has :HeartRateIterator;
    }
    
}