package ;

import raygen.RgScene;
import raygen.assets.RgSprite;

class BaseScene extends RgScene
{
    override function init() {
        var sprite:RgSprite = new RgSprite(0, 0, Rl.loadTexture("./assets/raygen.png"));
        sprite.center();
        register(sprite);
    }

    override function update() {
        super.update();
    }
}