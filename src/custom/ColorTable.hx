package custom;
import haxe.io.Bytes;
import haxe.ui.Toolkit;
import haxe.ui.components.Canvas;
import haxe.ui.graphics.ComponentGraphics;
import haxe.ui.util.Color;

class ColorTable extends Canvas {
    private var pixels:Bytes = null;
    
    public function new() {
        super();
        componentGraphics.setProperty("html5.graphics.method", "canvas");
    }
    
    private override function onReady() {
        super.onReady();
        pixels = Bytes.alloc(Std.int(this.width * this.height * 4));
        frame();
    }
    
    private function frame() {
        drawColorTable(componentGraphics, Std.int(this.width), Std.int(this.height), 1);
    }
    
    private var _n:Int = 360;
    private var _dir:Int = 0;
    private function drawColorTable(graphics:ComponentGraphics, width:Int, height:Int, size:Float) {
        var y = 0;
        for (j in 0...height) {
           for (i in 0...width) {
               var p = j * (width * 4) + i * 4;
               var c = hsvToRgb(i * _n / width, 1, 1 * (height - j) / height);
               pixels.set(p + 0, c.r);
               pixels.set(p + 1, c.g);
               pixels.set(p + 2, c.b);
               pixels.set(p + 3, 0xFF);
           }
           y++;
        }
        componentGraphics.clear();
        componentGraphics.setPixels(pixels);
        
        if (_dir == 0) {
            _n--;
            if (_n < 0) {
                _dir = 1;
                _n = 0;
            }
        } else if (_dir == 1) {
            _n++;
            if (_n > 360) {
                _dir = 0;
                _n = 360;
            }
        }
        Toolkit.callLater(frame);
    }
    
    private function hsvToRgb(hue:Float, saturation:Float, value:Float) {
        var hi = Std.int(Math.ffloor(hue / 60)) % 6;
        var f = hue / 60 - Math.ffloor(hue / 60);
        
        value = value * 255;
        
        var v = Std.int(value);
        var p = Std.int(value * (1 - saturation));
        var q = Std.int(value * (1 - f * saturation));
        var t = Std.int(value * (1 - (1 - f) * saturation));
        
        return switch (hi) {
            case 0: Color.fromComponents(v, t, p, 255);
            case 1: Color.fromComponents(q, v, p, 255);
            case 2: Color.fromComponents(p, v, t, 255);
            case 3: Color.fromComponents(p, q, v, 255);
            case 4: Color.fromComponents(t, p, v, 255);
            case _: Color.fromComponents(v, p, q, 255);
        }
    }
}