package hxray.management;

import hxray.internal.RgErrorScene;
import haxe.Exception;

/**
 * Used to switch scenes
 */
class RgGameMnger
{
    /**
     * The current loaded scene. It is recommended to not change this manually unless you know what you're doing.
     */
    public static var currentScene:hxray.RgScene;

    /**
     * Used to switch scenes. Automatically calls `unload` on the last scene, and `init` on the next.
     * @param scene the scene to switch to.
     */
    public static function switchScene(scene:hxray.RgScene)
    {
        try 
        {
            if (currentScene != null)
                currentScene.unload();

            currentScene = scene;

            currentScene.init();
        }
        catch (e:Exception)
        {
            callError(e.message, SCENESWITCH, RgGameMnger.currentScene);
        }
    }

    /**
     * Decides what to do in the event of an error.
     * 
     * **Can be rebound for your own logic.**
     * @param msg The error message
     * @param step The error step
     * @param scene The scene the error happened in. In the event of a SceneSwitch error, the scene the error happened in is used.
     */
    dynamic public static function callError(msg:String, step:RgTypes.ErrorStep, scene:RgScene)
    {
        var errTitle = "";

        switch (step)
        {
            case DRAW: errTitle = "Draw Error";
            case UPDATE: errTitle = "Update Error";
            case SCENESWITCH: errTitle = "SceneSwitch Error";
            default: errTitle = "Unknown Error";
        }

        switchScene(new RgErrorScene(msg, errTitle, scene));
    }
}