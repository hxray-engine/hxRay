package;

import raygen.Scene;
import raygen.SceneManager.*;

class RgGame
{
    static function new(sc:Scene) {
        Rl.initWindow(Cfg.window_width, Cfg.window_height, Cfg.window_title);

        Rl.setTargetFPS(Cfg.window_targetFPS);

        Rl.traceLog(Rl.TraceLogLevel.INFO, "Window Initialization Finished");

        switchScene(sc);

        Rl.traceLog(Rl.TraceLogLevel.INFO, "Initial scene loading finished, entering main loop...");

        while (!Rl.windowShouldClose())
        {
            currentScene.update();
            
            Rl.beginDrawing();
                Rl.clearBackground(Rl.Colors.BLACK);

                currentScene.draw();

                Rl.drawFPS(10, 10);
            Rl.endDrawing();
        }

        currentScene.unload();

        Rl.closeWindow();
    }
}