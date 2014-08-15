package com.mieaga.game.gameElements;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
class Enemy extends FlxGroup{
    /**空的*/
    public static var STATE_EMPTY:Int = 0;
    /**可打击的*/
    public static var STATE_GOOD:Int = 1;
    /**坏的*/
    public static var STATE_BAD:Int = 2;

    private var _target:FlxSprite;
    private var _currState:Int = 0;

    public var state (get, set):Int;

    public function new() {
        super();
        init();
    }

    private function init():Void{
        _target = new FlxSprite();
        _target.loadGraphic("assets/images/bird.png");
//        _target.pivotX = _target.width/2;
//        _target.pivotY = _target.height/2;
        add(_target);
    }
    public function setTarget(x:Float,y:Float):Void{
        _target.x = x;
        _target.y = y;
    }
    public function get_state():Int{
        return _currState;
    }
    public function set_state(value:Int):Int{
        return _currState = value;
    }
    public function addItem(state:Int = 1):Void{
        _currState = state;
    }
    public function clearAll():Void{
        remove(_target);
        _target.destroy();
        _target = null;
    }
}
