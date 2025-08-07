
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module Step {

	function drawText(dc, value, cx, cy, font, fontHeight) {       
        // var x = dc.getTextWidthInPixels(value, font);
        dc.drawText(cx, cy + 3*fontHeight/4, font, value, Gfx.TEXT_JUSTIFY_CENTER);

        dc.drawText(cx, cy + 3*fontHeight/2, font, "S", Gfx.TEXT_JUSTIFY_CENTER);
	}
}