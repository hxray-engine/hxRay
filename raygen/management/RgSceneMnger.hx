package raygen.management;

/**
 * Used to switch scenes
 */
class RgSceneMnger
{
    /**
     * The current loaded scene. It is recommended to not change this manually unless you know what you're doing.
     */
    public static var currentScene:raygen.RgScene;

    /**
     * Used to switch scenes. Automatically calls `unload` on the last scene, and `init` on the next.
     * @param scene the scene to switch to.
     */
    public static function switchScene(scene:raygen.RgScene)
    {
        if (currentScene != null)
            currentScene.unload();

        currentScene = scene;

        currentScene.init();
    }
}