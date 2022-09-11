package cli;

import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import massive.sys.io.File as MassiveFile;

using StringTools;

class CLI
{
    static var workingDir = "";

    static function main() {
        processCmd();
    }

    static function processCmd() {
        var args = Sys.args();

        if (args.length > 0)
        {
            /* Whenever CLI is called from Haxelib, it adds the working directory to the end.
            This is used to get the Cwd and isolate it from the other args.*/

            var lastArgument = "";

			for (i in 0...args.length)
			{
				lastArgument = args.pop();
				if (lastArgument.length > 0) break;
			}

			workingDir = new Path(lastArgument).toString();
        }

        if (args.length == 0)
            callCmd("help");
        else
        {
            callCmd(args[0], args.slice(1));
        }
    }

    static function callCmd(cmd:String, ?args:Array<String>)
    {
        switch (cmd)
        {
            case "version":
                Sys.println("RayGen Game Engine V0.0.1");
            case "help":
                Sys.println("");
            case "create":
                if (args.length == 0 || args.length > 1)
                {
                    Sys.println("USAGE: haxelib run raygen create PROJECTNAME");
                }
                else 
                {
                    var ppath = Sys.programPath();
                    var d = [];
                    if (Sys.systemName() == "Windows")
                        d = ppath.split("\\");
                    else 
                        d = ppath.split("/");
                    d = d.slice(0, d.length - 1);
                    ppath = d.join("/");
                    recursiveCopyDir(Path.join([ppath, "template"]), Path.join([workingDir, args[0]]));
                    Sys.println("Done!");
                }
        }
    }

    static function recursiveCopyDir(srcPath:String, dstPath:String, overwrite:Bool = true, ?filter:EReg, exclude:Bool = false)
    {
        // Windows can deal with forward slashes, but mlib thinks it can't be an absolute path
		if (Sys.systemName() == "Windows")
        {
            srcPath = srcPath.replace("/", "\\");
            dstPath = dstPath.replace("/", "\\");
        }

        final source = MassiveFile.create(srcPath);
        final destination = MassiveFile.create(dstPath, true);

        source.copyTo(destination, overwrite, filter, exclude);

        return destination.exists;
    }
}