package hxray.assets;

import Rl.RlVector2;
import Rl.Vector2;
import hxray.RgTypes.Axies;

/**
 * A 2D texture that can be displayed on screen.
 */
class RgSprite extends hxray.assets.base.RgObject
{
    private var _tex:Rl.Texture;

    /**
     * Tint of the sprite.
     */
    public var color:Rl.Color = Rl.Colors.WHITE;
    
    /**
     * The rotation of the sprite
     */
    public var angle:Float = 0;

    /**
     * The scale of the sprite
     */
    public var scale:Float = 1;

    /**
     * Constructor used to initialize internal variables. **It is not recommended to override this! use `init` instead!!**
     * @param x X position of the sprite
     * @param y Y position of the sprite
     * @param sprite Texture of the sprite
     */
    public override function new(x:Int, y:Int, sprite:Rl.Texture) {
        super(x, y, sprite.width, sprite.height);

        this._tex = sprite;
    }

    /**
     * Used to update internal variables upon every frame. called automatically.
     */
    override function update()
    {
        _tex.width = pos.w;
        _tex.height = pos.h;
    }

    /**
     * Used to draw the sprite on every frame
     */
    override function draw() {
        // Old
        // Rl.drawTexture(_tex, pos.x, pos.y, color);

        var posVec:RlVector2 = hxray.RgBindingFix.RlVector2.create(pos.x, pos.y);

        Rl.drawTextureEx(_tex, posVec, angle, scale, color);
    }

    /**
     * Used to unload and free all allocated resources, it is not recommended to override this, Called automatically upon scene switch or when un-registering the sprite.
     */
    override function unload()
    {
        Rl.unloadTexture(_tex);
    }

    /**
     * Automatically centers the sprite on the scree
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