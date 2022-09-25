package ;

import hxray.RgScene;
import hxray.assets.RgSprite;

class BaseScene extends RgScene
{
    override function init() {
        var sprite:RgSprite = new RgSprite(0, 0, Rl.loadTexture("./assets/hxray.png"));
        sprite.center();
        register(sprite);
    }

    override function update() {
        super.update();
    }
}