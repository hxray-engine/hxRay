package hxray.assets;

import hxray.assets.base.RgAsset;

/**
 * A 2D texture that can be displayed on screen.
 */
class RgSound extends hxray.assets.base.RgAsset
{
    private var _snd:Rl.Sound;

    /**
     * Whether or not the sound is currently playing
     */
    public var isPlaying(default, null):Bool = false;

    /**
     * Constructor used to initialize internal variables. **It is not recommended to override this! use `init` instead!!**
     * @param sound Sound to load
     */
    public override function new(sound:Rl.Sound) {
        super();

        this._snd = sound;
    }

    public override function update()
    {
        this.isPlaying = Rl.isSoundPlaying(_snd);
    }

    /**
     * Used to unload and free all allocated resources, it is not recommended to override this, Called automatically upon scene switch or when un-registering the sprite.
     */
    override function unload()
    {
        Rl.unloadSound(_snd);
    }

    public function play()
    {
        Rl.playSound(_snd);
    }

    public function pause() {
        Rl.pauseSound(_snd);
    }

    public function stop() {
        Rl.stopSound(_snd);
    }
}