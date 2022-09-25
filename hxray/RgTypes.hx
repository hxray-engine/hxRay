package hxray;

/**
 * Basic Rectangle, contains X, Y, Width, and Height.
 */
typedef Rect = 
{
    x:Int,
    y:Int,
    w:Int,
    h:Int
}

/**
 * Axies used for the `center` method on Sprites
 */
 enum Axies 
 {
     X;
     Y;
     XY;
 }

 /**
  * Different Steps an error can happen in.
  */
 enum ErrorStep
 {
    DRAW;
    UPDATE;
    SCENESWITCH;
    UNKNOWN;
    TEST;
 }