using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
//using Toybox.Graphics as Gfx;

module Utils {

    var myFont = null;
    var mySmallFont = null;
    function getFont() {
        if (myFont == null) {
            myFont = Ui.loadResource(Rez.Fonts.Man);
            // System.print("Font loaded: " + myFont);
        } else {
            //Sys.println("looks like font was already on mem");
        }
        return myFont; 
    }

    function getSmallFont() {
        if (mySmallFont == null) {
            mySmallFont = Ui.loadResource(Rez.Fonts.Man_Small);
        }
        return mySmallFont;
    }
    
    // function getColorMode() {
	// 	if (DoNotDisturb.isDND()) {
	//         return Gfx.COLOR_DK_GRAY;
	// 	}
	// 	else if (DoNotDisturb.isSleepy()) {
	//         return Gfx.COLOR_LT_GRAY;
	// 	}
	// 	else {
	//         return Gfx.COLOR_WHITE;
	// 	}
    // }
    
}