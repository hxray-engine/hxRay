package hxray.internal.macros;

import haxe.io.Path;
import sys.FileSystem;
#if macro
import haxe.macro.Expr;
import haxe.macro.Context;
#end

@:dox(hide)
class AssetBuilder
{
    #if macro
    static var fields:Array<Field>;

    public static function build(assetPath:String)
    {
        // get existing fields from the context from where build() is called
        fields = Context.getBuildFields();
        
        seek(assetPath);
        
        return fields;
    }

    static function seek(path:String)
    {
        if (!FileSystem.exists(Path.normalize(path)))
            return;
        for (dir in FileSystem.readDirectory(Path.normalize(path)))
        {
            if (!FileSystem.exists(Path.normalize(Path.join([path, dir]))))
                continue;
            if(FileSystem.isDirectory(Path.normalize(Path.join([path, dir]))))
                seek(Path.join([path, dir]));
            else 
            {
                assignToVar(Path.join([path, dir]));
            }
        }
    }

    static function assignToVar(path:String)
    {
        var ext = path.split(".")[path.split(".").length - 1];

        switch (ext)
        {
            case 'png' | 'jpg' | "jpeg":
                fields.push({
                    name:  "tex_" + Path.normalize(path).split("/")[Path.normalize(path).split("/").length - 1].split(".")[0],
                    access:  [Access.APublic, Access.AStatic],
                    kind: FieldType.FVar(macro:String, macro $v{Path.normalize(path)}), 
                    pos: Context.currentPos(),
                });
            
            case 'wav' | "ogg" | "mp3":
                fields.push({
                    name:  "snd_" + Path.normalize(path).split("/")[Path.normalize(path).split("/").length - 1].split(".")[0],
                    access:  [Access.APublic, Access.AStatic],
                    kind: FieldType.FVar(macro:String, macro $v{Path.normalize(path)}), 
                    pos: Context.currentPos(),
                });

            default:
                fields.push({
                    name:  "unknown_" + Path.normalize(path).split("/")[Path.normalize(path).split("/").length - 1].split(".")[0],
                    access:  [Access.APublic, Access.AStatic],
                    kind: FieldType.FVar(macro:String, macro $v{Path.normalize(path)}), 
                    pos: Context.currentPos(),
                });
        }
    }
    #end
}