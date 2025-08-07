
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
import Toybox.Time;
module Date {

	function drawText(dc, cx, cy, strDayOfWeekName, date, font, fontHeight) {
        // var dayOfWeek = Time.Gregorian.info(Time.now(), Time.FORMAT_SHORT).day_of_week;
        // var dayOfWeekNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        // var dayOfWeekName = dayOfWeekNames[dayOfWeek - 1]; // Convert to 0-based index
        
        // var xWeekDay = dc.getTextWidthInPixels(strDayOfWeekName, font);

        dc.drawText(cx, cy/2 - fontHeight/2, font, strDayOfWeekName, Gfx.TEXT_JUSTIFY_CENTER);

        // Draw date
        // var date = Time.Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var strDate = date.day.format("%02d");
        // var xDate = dc.getTextWidthInPixels(strDate, font);
        //date.day.format("%02d")
        // dc.drawText(cx*2-cx/2+xWeekDay/2, cy/2 + fontHeight/2, font, strDate, Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(cx, cy/2 + fontHeight/3, font, strDate, Gfx.TEXT_JUSTIFY_CENTER);
	}
}