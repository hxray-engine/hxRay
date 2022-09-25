package hxray;

import hxray.management.RgGameMnger;
import hxray.internal.RgErrorScene;
import haxe.Exception;
import hxray.RgScene;
import hxray.management.RgGameMnger.*;

/**
 * Basic game object.
 */
class RgGame
{
    @:dox(hide)
    static function main() {
        
    }

    /**
     * Makes a new instance of a game. does everything like setting up the window.
     * @param sc The scene you want to start on
     * @param width The width of the window
     * @param height The height of the window
     * @param title The title of the window
     * @param targetFPS The max FPS
     */
    public function new(sc:RgScene, width:Int, height:Int, title:String, targetFPS:Int) {
        RgGlobal.windowWidth = width;
        RgGlobal.windowHeight = height;
        RgGlobal.targetFPS = targetFPS;
        RgGlobal.bgColor = Rl.Colors.BLACK;

        Rl.initWindow(width, height, title);
        Rl.initAudioDevice();

        Rl.setTargetFPS(targetFPS);

        Rl.traceLog(Rl.TraceLogLevel.INFO, "Window Initialization Finished");

        switchScene(sc);

        Rl.traceLog(Rl.TraceLogLevel.INFO, "Initial scene loading finished, entering main loop...");

        while (!Rl.windowShouldClose())
        {
            try
            {
                currentScene.update();
            }
            catch (e:Exception)
            {
                callError(e.message, UPDATE, RgGameMnger.currentScene);
            }
            
            try 
            {
                Rl.beginDrawing();
                    Rl.clearBackground(RgGlobal.bgColor);
    
                    currentScene.draw();
    
                    Rl.drawFPS(10, 10);
                Rl.endDrawing();
            }
            catch (e:Exception)
            {
                callError(e.message, DRAW, RgGameMnger.currentScene);
            }
        }

        currentScene.unload();

        Rl.closeAudioDevice();
        Rl.closeWindow();
    }
}