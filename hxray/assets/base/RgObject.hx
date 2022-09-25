package hxray.assets.base;

import hxray.RgTypes.Rect;

/**
 * Basic object with X, Y, W, and H values.
 */
class RgObject extends RgAsset
{
    /**
     * Position and scaling of the object.
     */
    public var pos:Rect;

    public override function new(x:Int, y:Int, w:Int, h:Int) {
        super();

        this.pos = {x: x, y: y, w: w, h: h};
    }
}