package hxray;

//* Temporary solution until binding gets fixed

// Vector2, 2 components
@:include("raylib.h")
@:native("Vector2")
@:structAccess
extern class RlVector2 {
  var x:Float; // Vector x component
  var y:Float; // Vector y component

  static inline function create(x:Float, y:Float):Rl.Vector2 {
    return untyped __cpp__("{ (Float){0}, (Float){1} }", x, y);
  }
}