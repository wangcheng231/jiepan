package com.mieaga.game.core;
import flixel.FlxSprite;
import pgr.dconsole.DC;
import flixel.plugin.MouseEventManager;
import flixel.FlxG;
import flash.events.MouseEvent;
import com.mieaga.game.utils.TimeUtil;
import com.mieaga.game.gameElements.TileAbstract;
import com.mieaga.game.maps.MapGame;
import pgr.dconsole.DC;
import com.mieaga.game.gameElements.Enemy;
import flixel.text.FlxText;
import flixel.FlxState;

class YueGame extends FlxState{
    public static var TILE_WIDTH:Int = 100;

    private var _enemy:Enemy;
    private var _textField:FlxText;
    private var _canTouch:Bool = false;
    private var _isStart:Bool = false;
    
    private var _nums:Array<Int>;
    private var _tiles:Array<TileAbstract>;
    private var _escapeTime:Float;
    private var _oldMillSecs:Float = 0;

    private var _blankNums:Array<Int>;
    private var _preNum:Int = -1;
    private var _clickTime:Int = 0;

/**
	 * Function that is called up when to state is created to set it up.
	 */
    override public function create():Void
    {
        super.create();
        init();
    }
    private function init():Void{
        DC.log("YueGame init()");
        _oldMillSecs = -1;
        _clickTime = 0;
        _tiles = new Array();

        var back:FlxSprite = new FlxSprite();
        back.loadGraphic("assets/images/back.jpg");
        add(back);

        _textField = new FlxText(0,0,0,"00.000\"");
        _textField.color = 0xffffff;
        _textField.x = (Constants.STAGE_WIDTH - _textField.width)/2;
        _textField.y = 5.0;
        add(_textField);

        _enemy = new Enemy();
        MapGame.instance().createMap(0,0,TILE_WIDTH,Constants.STAGE_WIDTH,Constants.STAGE_HEIGHT);

        _enemy.setTarget(-150,-150);
        _enemy.addItem();
        add(_enemy);

        //获得map的编号
        _nums = MapGame.instance().getNums();
        DC.log("_nums: \n"+_nums);
        for(currNum in _nums){
            var tile:TileAbstract = new TileAbstract(TILE_WIDTH,dispatchMouseEvent);
//            var tile:TileAbstract = new TileAbstract(TILE_WIDTH,null);
            MouseEventManager.add(tile,onMouseClick);
            MouseEventManager.setMouseDownCallback(tile,onMouseClick);
            var dic:Map<String,Float> = MapGame.instance().getValueByNumber(currNum);
            var lableX:String = MapGame.COR_X;
            var lableY:String = MapGame.COR_Y;
            var corX:Float = dic[lableX];
            var corY:Float = dic[lableY];
            tile.x = corX;
            tile.y = corY;
//            add(tile);
            tile.setCurrNum(currNum);
            _tiles.push(tile);
        }
        _preNum = -1;
//        FlxG.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
        moveEnemy();
    }
    private function onMouseClick(e:TileAbstract):Void{
        DC.log("onMouseClick() e.currentTarget: ");
        if(!_canTouch) return;

        _canTouch = false;
        var currNum:Int = e.getCurrNum();
        if(_preNum == currNum){
            _isStart = true;
            _clickTime++;
//            YueRoot.assets.playSound("click");
//            _progressBar.ratio = _clickTime/YueConfig.maxTimes;
//            _enemy.alpha = 1 - _clickTime/(YueConfig.maxTimes*2);
            if(_clickTime>=3){
                //成功
//                clearAll();
//                dispatchEventWith(GAME_OVER, true, _escapeTime);
                DC.log("成功");
                FlxG.switchState(new YueSuccess());
                return;
            }
            moveEnemy();
        }else{
            //失败
//            FlxG.log(new YueMenu());
            DC.log("失败 failed");
            FlxG.switchState(new YueFailed());
        }
    }
    private function dispatchMouseEvent():Void {
        DC.log("dispatchMouseEvent()");

    }

/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
    override public function destroy():Void
    {
        super.destroy();
    }

    private function moveEnemy():Void{
        DC.log("moveEnemy()");
        //确定一个为敌人出现的
        var r:Int = cast(Math.random()*_nums.length);
        if(_preNum == r){
            if(_preNum+1>=_nums.length){
                r = _preNum-1;
            }else{
                r = _preNum+1;
            }
        }
        var enemyNum:Int = _nums[r];

        var dic:Map<String,Float> = MapGame.instance().getValueByNumber(enemyNum);
        var corX:Float = dic[MapGame.COR_X];
        var corY:Float = dic[MapGame.COR_Y];
//        _enemy.x = corX;
//        _enemy.y = corY;
        _enemy.setTarget(corX,corY);
        _preNum = enemyNum;

        _canTouch = true;
    }
/**
	 * Function that is called once every frame.
	 */
    override public function update():Void
    {
        super.update();
        if(!_isStart) return;
        var nowdate:Date = Date.now();
        var currMillSecs:Float = nowdate.getTime();
        if(_oldMillSecs == -1) _oldMillSecs = currMillSecs;
        _escapeTime = currMillSecs - _oldMillSecs;
        _textField.text = TimeUtil.formatMillSec(_escapeTime);
    }
}
