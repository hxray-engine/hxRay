// for some reason it only throws errors when this comment isn't here

package raygen.internal.macros;

import haxe.macro.Expr;
import haxe.macro.Context;
import sys.io.File;

using StringTools;

/**
 * Macro used to build the ``Cfg`` class. Not recommended to use yourself.
 */
class RgConfigBlder
{
    public static function build():Array<Field>
    {
        // get existing fields from the context from where build() is called
        var fields = Context.getBuildFields();

        var file:String = File.getContent("./assets/config.ini");

        var currentCategory:String = "";
        for (line in file.trim().split("\n"))
        {
            if (line.trim().startsWith(";") || line.trim() == "")
                continue;

            if (line.trim().startsWith("["))
            {
                currentCategory = line.substring(1, line.length - 2);
                continue;
            }


            var lineSplit = line.trim().split("=");

            var value = lineSplit[1];
            var pos = Context.currentPos();
            var fieldName = currentCategory + "_" + lineSplit[0];

            var myFunc:Function;

            if (Std.parseInt(value) == null)
            {
                // STRING

                myFunc = { 
                    expr: macro return $v{value},  // actual value
                    ret: (macro:String), // ret = return type
                    args:[] // no arguments here
                }
            }
            else
            {
                // INT

                myFunc = { 
                    expr: macro return $v{Std.parseInt(value)},  // actual value
                    ret: (macro:Int), // ret = return type
                    args:[] // no arguments here
                }
            }

            // create: `public static var $fieldName(get,null)`
            var propertyField:Field = {
                name:  fieldName,
                access: [Access.APublic, Access.AStatic],
                kind: FieldType.FProp("get", "null", myFunc.ret), 
                pos: pos,
            };

            // create: `private static inline function get_$fieldName() return $value`
            var getterField:Field = {
                name: "get_" + fieldName,
                access: [Access.APrivate, Access.AInline, Access.AStatic],
                kind: FieldType.FFun(myFunc),
                pos: pos,
            };

            // append both fields
            fields.push(propertyField);
            fields.push(getterField);
        }
        
        return fields;
    }
}