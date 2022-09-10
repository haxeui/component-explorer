package custom;

import haxe.io.Bytes;
import haxe.ui.Toolkit;
import haxe.ui.components.Canvas;

class Noise extends Canvas {
    @:clonable public var onlyReds:Bool = false;
    @:clonable public var onlyGreens:Bool = false;
    @:clonable public var onlyBlues:Bool = false;
    
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
    
    var skipFrame:Bool = false; // lets just slow it down in a hacky way bu skipping every other "frame"
    private function frame() {
        if (skipFrame == true) {
            skipFrame = false;
            Toolkit.callLater(frame);
            return;
        }
        
        skipFrame = true;
        
        var n = 0;
        for (y in 0...Std.int(height)) {
            for (x in 0...Std.int(width)) {
                
                var r = Std.random(0xFF);
                var g = Std.random(0xFF);
                var b = Std.random(0xFF);
                if (onlyReds) {
                   g = 0;
                   b = 0;
                } else if (onlyGreens) {
                    r = 0;
                    b = 0;
                } else if (onlyBlues) {
                    r = 0;
                    g = 0;
                }
                
                pixels.set(n++, r);
                pixels.set(n++, g);
                pixels.set(n++, b);
                pixels.set(n++, 0xFF);
            }
        }
        componentGraphics.clear();
        componentGraphics.setPixels(pixels);
        
        Toolkit.callLater(frame);
    }
}
