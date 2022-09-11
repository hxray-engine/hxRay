package;

import raygen.RgGame;

class Main
{
    static var startScene:RgScene = new BaseScene();
    static var width:Int = 1280;
    static var height:Int = 720;
    static var title:String = "Title";
    static var targetFPS:Int = 60;

    static function main() {
        var game = new RgGame(startScene, width, height, title, targetFPS);
    }
}