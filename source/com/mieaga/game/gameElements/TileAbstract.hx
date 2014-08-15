package com.mieaga.game.gameElements;
import flash.display3D.textures.Texture;
import flash.display.BitmapData;
import flash.display.Shape;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.addons.display.shapes.FlxShape;
class TileAbstract extends FlxSprite{
    private var _currNum:Int;
    private var _currState:Int = 0;
    private var _itemWidth:Int;

    private var bgShape:FlxShape;

    public function new(itemWidth:Int,onClick:Void->Void) {
//        super(0,0,"",onClick);
        super(0,0);
        _itemWidth = itemWidth;
        init();
    }
    private function init():Void{
        this.width = _itemWidth;
        this.height = _itemWidth;
//        var bgShape:Shape = new Shape();
//        bgShape.graphics.beginFill(0xff0000);
//        bgShape.graphics.drawRect(0,0,_itemWidth,_itemWidth);
//        bgShape.graphics.drawRect(0.5,0.5,_itemWidth-1,_itemWidth-1);
//        bgShape.graphics.endFill();
//
//        var bgBitmapData:BitmapData = new BitmapData(_itemWidth, _itemWidth, true, 0xff0000);
//        bgBitmapData.draw(bgShape);

        var topShape:Shape = new Shape();
//        topShape.graphics.beginFill(0xffff00,0.8);
//        topShape.graphics.drawRect(0,0,_itemWidth,_itemWidth);
//        topShape.graphics.endFill();
//        topShape.graphics.lineStyle(2,0xff0000);
//        topShape.graphics.lineTo(0,0);
//        topShape.graphics.lineTo(_itemWidth,0);
//        topShape.graphics.lineTo(_itemWidth,_itemWidth);
//        topShape.graphics.lineTo(0,_itemWidth);
//        topShape.graphics.lineTo(0,0);

//        topShape.graphics.beginFill(0xffff00);
//        topShape.graphics.drawRoundRectComplex(0, 0, _itemWidth, _itemWidth, 32, 80, 32, 80 );
//        topShape.graphics.endFill();
//        var topBitmapData:BitmapData = new BitmapData(_itemWidth, _itemWidth, true, 0xffff00);
//        topBitmapData.draw(topShape);

//        this.loadGraphic(bgBitmapData);

        topShape.graphics.beginFill(0xffff00,0.1);
        topShape.graphics.drawRect(0,0,_itemWidth,_itemWidth);
        topShape.graphics.endFill();
        var topBitmapData:BitmapData = new BitmapData(_itemWidth, _itemWidth, true, 0xffff00);
        topBitmapData.draw(topShape);
        this.loadGraphic(topBitmapData);
    }
    public function setCurrNum(__currNum:Int):Void{
        _currNum = __currNum;
    }
    public function getCurrNum():Int{
        return _currNum;
    }
    public function setCurrState(__currState:Int):Void{
        _currState = __currState;
    }
    public function getCurrState():Int{
        return _currState;
    }
}
