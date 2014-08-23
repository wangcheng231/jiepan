package com.mieaga.game.core;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import pgr.dconsole.DC;
import flixel.FlxState;
class YueSuccess extends FlxState {
    private var startButton:FlxButton;

/**
	 * Function that is called up when to state is created to set it up.
	 */
    override public function create():Void
    {
        super.create();
        var text:FlxText = new FlxText();
        text.x = Constants.STAGE_WIDTH/2;
        text.y = Constants.STAGE_HEIGHT*0.15;
        text.size = 20;
        text.text = "SUCCESS";
        add(text);

        startButton = new FlxButton(0,0,"",onButtonClick);
        startButton.x = (Constants.STAGE_WIDTH-startButton.width)/2;
        startButton.y = Constants.STAGE_WIDTH*0.35;
        startButton.loadGraphic("assets/images/start.jpg");
        add(startButton);
    }
    private function onButtonClick():Void{
        DC.log("YueSuccess onButtonClick() 1");
        FlxG.switchState(new YueGame());
    }

/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
    override public function destroy():Void
    {
        super.destroy();
    }

/**
	 * Function that is called once every frame.
	 */
    override public function update():Void
    {
        super.update();
    }
}
