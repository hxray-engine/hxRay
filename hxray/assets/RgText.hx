package hxray.assets;

import hxray.RgTypes.Axies;

/**
 * A 2D texture that can be displayed on screen.
 */
class RgText extends hxray.assets.base.RgObject
{
    public var text:String = "";

    public var fontSize = 32;

    public var fieldWidth:Int = 0;

    /**
     * Color of the text.
     */
     public var color:Rl.Color = Rl.Colors.WHITE;

    public override function new(x:Int, y:Int, text:String, fieldWidth:Int = 0, fontSize:Int = 32) {
        if (fieldWidth == 0)
        {
            this.fieldWidth = Rl.measureText(this.text, this.fontSize);
        }
        else 
            this.fieldWidth = fieldWidth;

        super(x, y, this.fieldWidth, 0);

        this.text = text;

        this.fontSize = fontSize;
    }

    /**
     * Used to update internal variables upon every frame. called automatically.
     */
    override function update()
    {
        this.pos.h = fontSize;
        this.pos.w = fieldWidth;
    }

    /**
     * Used to draw the text on every frame, only override this if you know what you're doing!
     */
    override function draw() {
        Rl.drawText(text, pos.x, pos.y, fontSize, color);
    }

    /**
     * Used to unload and free all allocated resources, it is not recommended to override this, Called automatically upon scene switch or when un-registering the sprite.
     */
    override function unload()
    {
        
    }

    /**
     * Automatically centers the text on the screen
     * @param axies the axies to center the sprite on. Takes either `X`, `Y`, or `XY`. If left empty, `XY` is used.
     */
    public function center(?axies:Axies)
    {
        if (axies == X || axies == XY || axies == null)
            pos.x = Std.int((RgGlobal.windowWidth / 2) - (pos.w / 2));
        if (axies == Y || axies == XY || axies == null)
            pos.y = Std.int((RgGlobal.windowHeight / 2) - (pos.h / 2));
    }
}