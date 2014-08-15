package com.mieaga.game.utils;
class TimeUtil {
/**显示格式为：01:01.000" */
    public static function formatMillSec(escapeTime:Float):String{
        var hournum:Int = 0;
        var min:Int = 0;
        var sec:Int = 0;
        var millsec:Int = 0;

        hournum = cast(escapeTime/3600000,Int);
        min = cast(escapeTime % 3600000 / 60000,Int);
        sec = cast(escapeTime % 3600000 % 60000 / 1000,Int);
        millsec = cast(escapeTime % 3600000 % 60000 % 1000,Int);

        var result:String = "";
        if (hournum > 0)
        {
            trace("hournum > 0 hournum: "+hournum);
            result = result + (check10(hournum) + ":");
        }
        if(min > 0){
            trace("min > 0 min: "+min);
            result = result + (check10(min) + ":");
        }
        result = result + (check10(sec) + ":");
        result = result + (check100(millsec));
        return result;
    }
    public static function check10(time:Int) : String
    {
        var str:String = cast(time);
        if (time < 10)
        {
            str = "0" + str;
        }
        return str;
    }
    public static function check100(time:Int) : String
    {
        var str:String = cast(time);
        if (time < 10)
        {
            str = "00" + str;
        }else if(time<100){
            str = "0" + str;
        }
        return str;
    }
}
