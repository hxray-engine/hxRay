package raygen;

import raygen.assets.base.Asset;

/**
 * Basic Scene object, extend this to make a scene.
 */
class RgScene
{
    /**
     * Current registered assets. only directly modify this if you know what you're doing, use `register` and `unregister` instead.
     */
    public var assetQueue(default, default):Array<Asset>;

    /**
     * Initialized the assetQueue. Please don't override this, use `init` instead.
     */
    public function new()
    {
        assetQueue = [];
    }

    /**
     * Does nothing by default, can be used to initialize and register your objects.
     */
    public function init()
    {

    }

    /**
     * Runs every frame, updates every asset by default.
     */
    public function update()
    {
        for (asset in assetQueue)
        {
            asset.update();
        }
    }

    /**
     * Runs every frame, calls `draw` on every asset by default.
     */
    public function draw()
    {
        for (asset in assetQueue)
        {
            asset.draw();
        }
    }

    /**
     * **CANNOT BE OVERRIDEN!**
     * 
     * Runs upon scene-switch. used to unload and free all the remaining resources.
     */
    final public function unload()
    {
        // unload every remaining asset

        for (asset in assetQueue)
        {
            asset.unload();
            assetQueue.remove(asset);
        }
    }

    /**
     * **CANNOT BE OVERRIDEN!**
     * 
     * Used to add assets to the asset-queue
     * @param asset The asset you want to add.
     */
    final public function register(asset:Asset)
    {
        Rl.traceLog(Rl.TraceLogLevel.DEBUG, "Registering Asset " + Asset);
        assetQueue.push(asset);
    }

    /**
     * **CANNOT BE OVERRIDEN!**
     * 
     * Used to remove assets from the asset-queue. Automatically calls `unload`.
     * @param asset the asset to remove.
     */
    final public function unregister(asset:Asset)
    {
        asset.unload();
        assetQueue.remove(asset);
    }
}