package com.mieaga.game.maps;

class MapGame {
    /**中心点x*/
    public static var COR_X:String = "corx";
    /**中心点y*/
    public static var COR_Y:String = "cory";
    /**当前行信息*/
    public static var CURR_ROW_NUM:String = "currrownum";
    /**当前列信息*/
    public static var CURR_COL_NUM:String = "currcolnum";
    /**当前状态 0：空的，1：可以点击的，2：不可以点击的*/
    public static var CURR_STATE:String = "currstate";

    private static var _instance:MapGame;
    private var _isinited:Bool = false;

    private var _dic:Map<Int,Map<String,Float>>;
    private var _nums:Array<Int>;
    private var _col:Int;
    private var _row:Int;
    private var _initX:Float;
    private var _initY:Float;
    private var _itemWidth:Float;

    private var _maxNum:Int;

    private function new() {
    }
    private function init():Void{
        _isinited = false;
        _dic = new Map();
        _nums = new Array();
    }
    /**create map
		 * 编号从0开始算起
		 * */
    public function createMap(initX:Float,initY:Float,itemWidth:Float,maxWidth:Float,maxHeight:Float):Void{
        init();

        //计算列
        var col:Int = cast(maxWidth/itemWidth,Int);
        //在最大宽度下居中
        var offx:Float = (maxWidth-col*itemWidth)/2;
        initX = initX+offx;

        //计算行
        var row:Int = cast(maxHeight/itemWidth,Int);

        var offy:Float = (maxHeight-row*itemWidth)/2;
        initY = initY+offy;

        _initX = initX;
        _initY = initY;
        _itemWidth = itemWidth;
        _col = col;
        _row = row;

        initMap();
        _isinited = true;
    }

    private function initMap():Void{
        var maxNum:Int = _col*_row;
        for(i in 0...maxNum){
            var v:Map<String,Float> = new Map();
//            var v:Dynamic = {};
            var currRowNum:Int = cast(i/_col);
            var currColNum:Int = cast(i%_col);
//            var corX:Float = _initX+currColNum*_itemWidth+_itemWidth/2;
//            var corY:Float = _initY+currRowNum*_itemWidth+_itemWidth/2;
            var corX:Float = _initX+currColNum*_itemWidth;
            var corY:Float = _initY+currRowNum*_itemWidth;

            v[CURR_ROW_NUM] = currRowNum;
            v[CURR_COL_NUM] = currColNum;
            v[COR_X] = corX;
            v[COR_Y] = corY;
            v[CURR_STATE] = 0;

            _dic[i] = v;
            _nums.push(i);
        }
    }

/**根据编号获得值*/
    public function getValueByNumber(num:Int):Map<String,Float>{
        return _dic[num];
    }
/**获得编号列表*/
    public function getNums():Array<Int>{
        return _nums;
    }

    public function clearAll():Void{
        _nums = null;
        _dic = null;
    }

    public static function instance():MapGame{
        if(_instance == null){
            _instance = new MapGame();
        }
        return _instance;
    }

}
