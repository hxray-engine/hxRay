package hxray.internal;

import hxray.management.RgGameMnger;
import hxray.assets.RgText;

/**
 * A screen automatically called in the event of an error.
 */
class RgErrorScene extends RgScene
{
    public var errorCode:String;

    public var errorStep:String;

    public var inScene:RgScene;

    public override function new(errorCode:String, errorStep:String, inScene:RgScene)
    {   
        this.errorCode = errorCode;
        this.errorStep = errorStep;
        this.inScene = inScene;

        super();
    }

    public override function init()
    {
        RgGlobal.bgColor = Rl.Colors.RED;

        register(new RgText(20, 20, errorStep, 0, 80));


        register(new RgText(20, 120, "It seems RayGen Crashed and had to send you to this special error scene, to avoid any further trouble.", 0, 20));
        register(new RgText(20, 160, "ERROR CODE: " + errorCode + "\nIn Scene: " + inScene + "\n\n" + RgGlobal.bugreportline, 0, 20));
    }

    public override function update()
    {

    }
}