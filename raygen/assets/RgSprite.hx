package raygen.assets;

/**
 * A 2D texture that can be displayed on screen.
 */
class RgSprite extends raygen.assets.base.RgObject
{
    private var _tex:Rl.Texture;

    /**
     * Tint of the sprite.
     */
    public var color:Rl.Color = Rl.Colors.WHITE;

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
     * Used to draw the sprite on every frame, only override this if you know what you're doing!
     */
    override function draw() {
        Rl.drawTexture(_tex, pos.x, pos.y, color);
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

/**
 * Axies used for the `center` method on Sprites
 */
enum Axies 
{
    X;
    Y;
    XY;
}