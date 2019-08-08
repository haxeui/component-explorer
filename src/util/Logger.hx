package util;

import haxe.ui.components.TextArea;

class Logger {
    public static var logData:TextArea;
    
    public static function log(s:String) {
        logData.text += s + "\n";
    }
    
    public static function clear() {
        logData.text = "";
    }
}