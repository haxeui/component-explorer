package custom;

import haxe.io.Bytes;
import haxe.ui.Toolkit;
import haxe.ui.components.Canvas;

class Noise extends Canvas {
    public function new() {
        super();
        componentGraphics.setProperty("html5.graphics.method", "canvas");
    }
    
    private override function onReady() {
        super.onReady();
        frame();
    }
    
    private function frame() {
        var pixels = Bytes.alloc(Std.int(this.width * this.height * 4));
        var n = 0;
        for (y in 0...Std.int(height)) {
            for (x in 0...Std.int(width)) {
                pixels.set(n++, Std.random(0xFF));
                pixels.set(n++, Std.random(0xFF));
                pixels.set(n++, Std.random(0xFF));
                pixels.set(n++, 0xFF);
            }
        }
        componentGraphics.clear();
        componentGraphics.setPixels(pixels);
        
        Toolkit.callLater(frame);
    }
}