package hxray;

import sys.io.File;

/**
 * Class used for mapping controls to certain actions
 */
class RgControls
{
    /**
     * Map of keycodes to actions
     */
    public static var actionMap(default, null):Map<String, Array<Int>>;

    /**
     * Path to the keymap, used for reloading and saving
     */
    public static var keyMapPath:String;

    /**
     * Reads the keymap from a file
     * @param filePath path to the keymap relative to the exe
     */
    public static function readKeyMap(filePath:String = "./assets/keymap.txt")
    {
        keyMapPath = filePath;

        actionMap = new Map<String, Array<Int>>();

        var contents = File.getContent(filePath);

        var lines = contents.split("\n");

        for (line in lines)
        {
            var things = line.split(":");

            var action = things[0];

            var keys:Array<Int> = [];

            for (key in things.slice(1))
            {
                keys.push(Std.parseInt(key));
            }

            actionMap.set(action, keys);
        }
    }

    /**
     * Rebinds an action, will delete any existing binding.
     * @param action the action to bind
     * @param keyCodes the keycodes to use
     */
    public static function bindSingleAction(action:String, keyCodes:Array<Int>) {
        actionMap.set(action, keyCodes);
    }

    /**
     * Unbinds an action.
     * @param action the action to unbind
     */
    public static function unbindSingleAction(action:String) {
        actionMap.remove(action);
    }

    /**
     * Saves the current ActionMap to a file.
     */
    public static function saveToKeyMap()
    {
        var finalS:String = "";

        for (action in actionMap.keys())
        {
            finalS += action;
            for (key in actionMap[action])
            {
                finalS += ":" + key;
            }
            finalS += "\n";
        }

        File.saveContent(keyMapPath, finalS);
    }

    /**
     * Reloads the actionmap
     */
    public static function reloadKeyMap()
    {
        actionMap.clear();

        var contents = File.getContent(keyMapPath);

        var lines = contents.split("\n");

        for (line in lines)
        {
            var things = line.split(":");

            var action = things[0];

            var keys:Array<Int> = [];

            for (key in things.slice(1))
            {
                keys.push(Std.parseInt(key));
            }

            actionMap.set(action, keys);
        }
    }

    /**
     * Checks whether any key of an action is pressed.
     * @param action the action to check
     * @return true if the action is pressed
     */
    public static function isDown(action:String):Bool {
        for (keycode in actionMap[action])
        {
            if (Rl.isKeyDown(keycode))
            {
                return true;
            }
        }
        return false;
    }

    /**
     * Checks whether any key of an action isn't down.
     * @param action the action to check
     * @return true if the action is pressed
     */
    public static function isUp(action:String):Bool {
        for (keycode in actionMap[action])
        {
            if (Rl.isKeyUp(keycode))
            {
                return true;
            }
        }
        return false;
    }
}