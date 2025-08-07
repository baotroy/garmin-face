
using Toybox.Graphics as Gfx;
using Toybox.WatchUi as Ui;
using Toybox.ActivityMonitor as Act;
import Toybox.System;
module Calories {

	function drawText(dc, value, cx, cy, font, fontHeight) {
        // var fontz = Gfx.FONT_TINY;
        // var fH = dc.getFontHeight(font);
        // var x = dc.getTextWidthInPixels(value, font);

        dc.drawText(cx, cy/2 - fontHeight/2, font, "9999", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText(cx, cy/2 + fontHeight/3, font, "C", Gfx.TEXT_JUSTIFY_CENTER);
	}
}