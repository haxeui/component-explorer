package custom;

import haxe.io.Bytes;
import haxe.ui.Toolkit;
import haxe.ui.components.Canvas;

class MiniGraph extends Canvas {
    private var _dataPoints:Array<Int> = [];
    private var pixels:Bytes = null;
    
    public function new() {
        super();
        componentGraphics.setProperty("html5.graphics.method", "canvas");
    }
    
    private override function onReady() {
        super.onReady();
        pixels = Bytes.alloc(Std.int(this.width * this.height * 4));
        populateDataPoints();
        frame();
    }
    
    private function populateDataPoints() {
        var cx = Std.int(this.width);
        var missing = cx - _dataPoints.length;
        for (_ in 0...missing) {
            generateDataPoint();
        }
    }

    private function generateDataPoint() {
        var cx = Std.int(this.width);
        var cy = Std.int(this.height);
        var prevPoint:Null<Int> = null;
        if (_dataPoints.length > 0) {
            prevPoint = _dataPoints[_dataPoints.length - 1];
        }
        var nextPoint = Std.int(Math.random() * cy);
        if (prevPoint != null) {
            if (Math.random() > .5) {
                nextPoint = prevPoint + Std.random(2);
            } else {
                nextPoint = prevPoint - Std.random(2);
            }
        }
        if (nextPoint < 3) {
            nextPoint = 3;
        } else if (nextPoint > cy - 3) {
            nextPoint = cy - 3;
        }
        _dataPoints.push(nextPoint);
        if (_dataPoints.length > cx) {
            _dataPoints.shift();
        }
    }
    
    var skipFrame:Bool = false; // lets just slow it down in a hacky way bu skipping every other "frame"
    private function frame() {
        if (skipFrame == true) {
            skipFrame = false;
            Toolkit.callLater(frame);
            return;
        }
        
        skipFrame = true;
        
        var cx = Std.int(this.width);
        var cy = Std.int(this.height);
        if (cx * cy * 4 != pixels.length) {
            pixels = Bytes.alloc(Std.int(this.width * this.height * 4));
            populateDataPoints();
        }
        generateDataPoint();
        
        for (x in 0...cx) {
            for (y in 0...cy) {
                var n = ((y * cx) + x) * 4;
                var r = 0x0; var g = 0x0; var b = 0x0; var a = 0x0;
                
                var data = _dataPoints[x];
                if (data >= cy - y) {
                    r = 0x9c; g = 0xb4; b = 0xdb; a = 0xa0;
                    if (data == cy - y) {
                        r = 0x4e; g = 0x73; b = 0xb5;
                    }
                }
                
                pixels.set(n++, r);
                pixels.set(n++, g);
                pixels.set(n++, b);
                pixels.set(n++, a);
            }                
        }
        
        componentGraphics.clear();
        componentGraphics.setPixels(pixels);
        
        Toolkit.callLater(frame);
    }
}