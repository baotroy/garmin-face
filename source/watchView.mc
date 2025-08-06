using Toybox.WatchUi as Ui;
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.ActivityMonitor;
using Toybox.Graphics as Gfx;

class watchView extends WatchUi.WatchFace {
    hidden var cx;
    hidden var cy;
    function initialize() {
        WatchFace.initialize();
        
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
         // G spot
        cx = dc.getWidth() / 2;
        cy = dc.getHeight() / 2;
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
         // reset screen
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        dc.clear();
        // Get the current time and format it correctly
        // var timeFormat = "$1$:$2$";
        var hrIterator = ActivityMonitor.getHeartRateHistory(10, false);
        var sample = hrIterator.next();                                   // get the previous HR
       
        // get ActivityMonitor info
        var info = ActivityMonitor.getInfo();

        var lastHour = null;
        var lastMinute = null;
        var heartRate = 0;
        var steps = 0;
        var calories = 0;
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        var minutes = clockTime.min;

        //  return [previous.heartRate, info.steps, info.calories];
        // if (heartRate != healthInfo[0])

        if (lastHour != hours || lastMinute != minutes || heartRate != sample.heartRate || steps != info.steps || calories != info.calories) {
            lastHour = hours;
            lastMinute = minutes;
            heartRate = sample.heartRate;
            steps = info.steps;
            calories = info.calories;
        } else {
            // No need to update if the time hasn't changed
            return;
        }
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (Application.Properties.getValue("UseMilitaryFormat")) {
                // timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        // var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the view
        // var viewHour = View.findDrawableById("HourLabel") as Text;
        // view.setColor(Application.Properties.getValue("ForegroundColor") as Number);
        // viewHour.setText(hours.format("%02d"));
        var text_height_digit = dc.getFontHeight(Utils.getFont());
        var hour_width_digit = dc.getTextWidthInPixels(hours.format("%02d"), Utils.getFont());
        var minute_width_digit = dc.getTextWidthInPixels(minutes.format("%02d"), Utils.getFont());

        drawText(dc, cx-hour_width_digit/2, cy-text_height_digit + 5, hours.format("%02d"));

        drawText(dc, cx-minute_width_digit/2, cy-5, minutes.format("%02d"));

        // Heart rate
        HeartRate.drawText(dc, cx, cy);


        // var viewMinute = View.findDrawableById("MinuteLabel") as Text;
        // view.setColor(Application.Properties.getValue("ForegroundColor") as Number);
        // viewMinute.setText(minutes.format("%02d"));
// System.print("Heart Rate: " + heartRate);
//         System.print("Steps: " + steps);
//         System.print("Calories: " + calories);
        // Update the heart rate
        var viewHeartRate = View.findDrawableById("HeartRatesLabel") as Text;
        viewHeartRate.setText(heartRate ? heartRate.format("%d"): "-");
        var viewSteps = View.findDrawableById("StepsLabel") as Text;
        viewSteps.setText(steps ? steps.format("%d"): "0");
        var viewCalories = View.findDrawableById("CaloriesLabel") as Text;
        viewCalories.setText(calories ? calories.format("%d"): "000");
        
//  if (HeartRate.hrON()) {
//              HeartRate.drawText(dc, cx, cy);
//         }
//   var myFont = Ui.loadResource(Rez.Fonts.id_font_myFont);
//         // System.print(myFont);
//         dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
//         dc.drawText(100, 100, myFont, "10", Gfx.TEXT_JUSTIFY_LEFT);
        // Call the parent onUpdate function to redraw the layout
        // View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

    function drawText(dc, x, y, text) {
        var myFont = Utils.getFont();
        // System.print(myFont);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, myFont, text, Gfx.TEXT_JUSTIFY_LEFT);
    }
}
