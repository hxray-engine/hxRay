package hxray;

import Rl.Color;

/**
 * Contains some global variables and functions you would commonly use in games.
 */
class RgGlobal
{
    @:allow(hxray.RgGame) public static var windowWidth(default, null):Int;
    @:allow(hxray.RgGame) public static var windowHeight(default, null):Int;
    @:allow(hxray.RgGame) public static var targetFPS(default, null):Int;

    public static var bgColor:Color;

    /**
     * Used incase RayGen sends you to the error screen.
     * 
     * Gets placed at the end of the error screen. use for bug reporting instructions.
     */
    public static var bugreportline:String = "[PUT BUG REPORT INSTRUCTIONS HERE BY EDITING RgGlobal.bugreportline]";
}