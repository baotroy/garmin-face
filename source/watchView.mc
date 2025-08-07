using Toybox.WatchUi as Ui;
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
using Toybox.ActivityMonitor;
using Toybox.Graphics as Gfx;
import Toybox.Time;
using Toybox.ActivityMonitor as Act;
using Toybox.Math as Math;

class watchView extends WatchUi.WatchFace {
    hidden var cx;
    hidden var cy;
    hidden var widgetFont;
    hidden var widgetFontHeight;
    // hidden var lastHour = null;
    // hidden var lastMinute = null;
    // hidden var lastHeartRate = null;
    var steps = 0;
    var calories = 0;
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
        if (widgetFont == null) {
            widgetFont = Gfx.FONT_TINY;
            widgetFontHeight = dc.getFontHeight(widgetFont);
        }
         // reset screen
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_BLACK);
        dc.clear();
        // Get the current time and format it correctly
        // var timeFormat = "$1$:$2$";
        
        // get ActivityMonitor info
        // var info = ActivityMonitor.getInfo();

        var heartRate = 0;
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        var minutes = clockTime.min;
        var stats = System.getSystemStats();
         if (HeartRate.hrON()) {
            var hrIter = Act.getHeartRateHistory(null, true);
            if(hrIter != null){
                var hr = hrIter.next();
                heartRate = (hr.heartRate != Act.INVALID_HR_SAMPLE && hr.heartRate > 0) ? hr.heartRate : 0;
            }
        }

        //  return [previous.heartRate, info.steps, info.calories];
        // if (heartRate != healthInfo[0])

        // if (lastHour != hours || lastMinute != minutes || heartRate != lastHeartRate || steps != info.steps || calories != info.calories) {
        //     lastHour = hours;
        //     lastMinute = minutes;
        //     lastHeartRate = heartRate;
        //     steps = info.steps;
        //     calories = info.calories;
        // } else {
        //     // No need to update if the time hasn't changed
        //     return;
        // }
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
        // Get date information
        var dayOfWeek = Time.Gregorian.info(Time.now(), Time.FORMAT_SHORT).day_of_week;
        var dayOfWeekNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
        var dayOfWeekName = dayOfWeekNames[dayOfWeek - 1]; // Convert to 0-based index
        var date = Time.Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        // var xWeekDay = dc.getTextWidthInPixels(dayOfWeekName, widgetFont);


        drawText(dc, cx-hour_width_digit/2, cy-text_height_digit + 5, hours.format("%02d"));

        drawText(dc, cx-minute_width_digit/2, cy-5, minutes.format("%02d"));

        // Values in the same column have the same x position
        // Caluclate x position for calories and steps
        
        var xStep = dc.getTextWidthInPixels(steps.format("%d"), widgetFont);
        var xCalories = dc.getTextWidthInPixels(calories.format("%d"), widgetFont);
        var xMaxFirstCol = arrayMax([xStep, xCalories]);
        var xFirstCol = cx/2 - xMaxFirstCol;
        Step.drawText(dc, steps.format("%d"), xFirstCol, cy, widgetFont, widgetFontHeight);
        Calories.drawText(dc, calories.format("%d"), xFirstCol, cy, widgetFont, widgetFontHeight);
        
        var strHeartRate = heartRate > 0 ? heartRate.format("%d") : "--";
        var xHeartRate = dc.getTextWidthInPixels(strHeartRate, widgetFont);
        var xDayOfWeekName = dc.getTextWidthInPixels(dayOfWeekName, widgetFont);
        var xMaxSecondCol = arrayMax([xHeartRate, xDayOfWeekName]);
        var xSecondCol =  cx * 2 - cx / 2 + xMaxSecondCol / 2;

        Date.drawText(dc, xSecondCol, cy, dayOfWeekName, date, widgetFont, widgetFontHeight); // Draw the date
        HeartRate.drawText(dc, heartRate, xSecondCol, cy, widgetFont, widgetFontHeight);

        Battery.drawText(dc, (Math.round(stats.battery).toNumber()).toString(), cx, cy, widgetFont, widgetFontHeight); // Placeholder for battery percentage

        // var viewMinute = View.findDrawableById("MinuteLabel") as Text;
        // view.setColor(Application.Properties.getValue("ForegroundColor") as Number);
        // viewMinute.setText(minutes.format("%02d"));
        // System.print("Heart Rate: " + heartRate);
        //         System.print("Steps: " + steps);
        //         System.print("Calories: " + calories);
        // Update the heart rate
        // var viewHeartRate = View.findDrawableById("HeartRatesLabel") as Text;
        // viewHeartRate.setText(heartRate ? heartRate.format("%d"): "-");
        // var viewSteps = View.findDrawableById("StepsLabel") as Text;
        // viewSteps.setText(steps ? steps.format("%d"): "0");
        // var viewCalories = View.findDrawableById("CaloriesLabel") as Text;
        // viewCalories.setText(calories ? calories.format("%d"): "000");
        
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
        // dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, myFont, text, Gfx.TEXT_JUSTIFY_LEFT);
    }

    function arrayMax(arr) {
        if (arr == null || arr.size() == 0) {
            return null; // Or throw an exception
        }
        var maxVal = arr[0] as Number;
        for (var i = 1; i < arr.size(); i++) {
            if (arr[i] > maxVal) {
                maxVal = arr[i];
            }
        }
        return maxVal;
    }
}
