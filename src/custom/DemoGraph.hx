package custom;

import haxe.ui.Toolkit;
import haxe.ui.components.Canvas;
import haxe.ui.geom.Point;
import haxe.ui.graphics.ComponentGraphics;

class DemoGraph extends Canvas {
    public function new() {
        super();
        frame();
    }
    
    private static var offset1:Float = 0;
    private static var offset1Direction = 1;
    
    private var _pointA:Point = new Point(110, 410);
    private var _pointADirection = 1;
    private var _pointAOffset:Float = 0;
    private var _pointB:Point = new Point(310, 10);
    private var _pointBDirection = 1;
    private var _pointBOffset:Float = 0;
    private var _pointC:Point = new Point(510, 410);
    private var _pointCDirection = 1;
    private var _pointCOffset:Float = 0;
    private function frame() {
        componentGraphics.clear();
        
        drawGrid(componentGraphics, 520, 420, 10);
        
        createCubicBezier(componentGraphics, 10 - offset1, 10, 20 + offset1, 20, 40 - offset1, 20, 50 + offset1, 10);
        createCubicBezier(componentGraphics, 70 - offset1, 10, 70 + offset1, 20, 110 - offset1, 20, 110 + offset1, 10);
        createCubicBezier(componentGraphics, 130 - offset1, 10, 120 + offset1, 20, 180 - offset1, 20, 170 + offset1, 10);

        createCubicBezier(componentGraphics, 10 - offset1, 60, 20 + offset1, 80, 40 - offset1, 80, 50 + offset1, 60);
        createCubicBezier(componentGraphics, 70 - offset1, 60, 70 + offset1, 80, 110 - offset1, 80, 110 + offset1, 60);
        createCubicBezier(componentGraphics, 130 - offset1, 60, 120 + offset1, 80, 180 - offset1, 80, 170 + offset1, 60);

        createCubicBezier(componentGraphics, 10 - offset1, 110, 20 + offset1, 140, 40 - offset1, 140, 50 + offset1, 110);
        createCubicBezier(componentGraphics, 70 - offset1, 110, 70 + offset1, 140, 110 - offset1, 140, 110 + offset1, 110);
        createCubicBezier(componentGraphics, 130 - offset1, 110, 120 + offset1, 140, 180 - offset1, 140, 170 + offset1, 110);
        
        if (offset1Direction == 1) {
            offset1 += .1;
        } else {
            offset1 -= .1;
        }
        if (offset1 > 10) {
            offset1Direction = 0;
        } else if (offset1 < 0) {
            offset1Direction = 1;
        }
        
        componentGraphics.strokeStyle("red", 2);
        componentGraphics.moveTo(_pointA.x + _pointAOffset, _pointA.y);
        componentGraphics.lineTo(_pointB.x, _pointB.y + _pointBOffset);

        componentGraphics.moveTo(_pointB.x, _pointB.y + _pointBOffset);
        componentGraphics.lineTo(_pointC.x - _pointCOffset, _pointC.y);

        componentGraphics.moveTo(_pointC.x - _pointCOffset, _pointC.y);
        componentGraphics.lineTo(_pointA.x + _pointAOffset, _pointA.y);
        
        componentGraphics.strokeStyle("red", 2);
        componentGraphics.fillStyle("red");
        componentGraphics.circle(_pointA.x + _pointAOffset, _pointA.y, 3);
        
        componentGraphics.strokeStyle("red", 2);
        componentGraphics.fillStyle("red");
        componentGraphics.circle(_pointB.x, _pointB.y + _pointBOffset, 3);
        
        componentGraphics.strokeStyle("red", 2);
        componentGraphics.fillStyle("red");
        componentGraphics.circle(_pointC.x - _pointCOffset, _pointC.y, 3);
        
        componentGraphics.strokeStyle("blue", 2);
        componentGraphics.fillStyle(null);
        componentGraphics.moveTo(_pointA.x + _pointAOffset, _pointA.y);
        componentGraphics.curveTo(_pointB.x, _pointB.y + _pointBOffset, _pointC.x - _pointCOffset, _pointC.y);
        
        if (_pointADirection == 1) {
            _pointAOffset++;
        } else {
            _pointAOffset--;
        }
        
        if (_pointAOffset > 100) {
            _pointADirection = 0; 
        } else if (_pointAOffset < 0) {
            _pointADirection = 1;
        }
        
        if (_pointBDirection == 1) {
            _pointBOffset++;
        } else {
            _pointBOffset--;
        }
        
        if (_pointBOffset > 150) {
            _pointBDirection = 0; 
        } else if (_pointBOffset < 0) {
            _pointBDirection = 1;
        }
        
        if (_pointCDirection == 1) {
            _pointCOffset++;
        } else {
            _pointCOffset--;
        }
        
        if (_pointCOffset > 100) {
            _pointCDirection = 0; 
        } else if (_pointCOffset < 0) {
            _pointCDirection = 1;
        }
        
        Toolkit.callLater(frame);
    }
    
    private function createCubicBezier(graphics:ComponentGraphics, startX:Float, startY:Float, x1:Float, y1:Float, x2:Float, y2:Float, x:Float, y:Float) {
        graphics.strokeStyle("blue");
        graphics.moveTo(startX, startY);
        graphics.cubicCurveTo(x1, y1, x2, y2, x, y);
        
        graphics.strokeStyle("red");
        graphics.moveTo(startX, startY);
        graphics.lineTo(x1, y1);

        graphics.strokeStyle("red");
        graphics.moveTo(x2, y2);
        graphics.lineTo(x, y);
        
    }
    
    private function drawGrid(graphics:ComponentGraphics, cx:Float, cy:Float, gridSize:Float) {
        var size = .5;
        #if haxeui_heaps 
        size = 1;
        #end
        graphics.strokeStyle(0xCCCCCC, size);
        for (x in 0...Std.int((cx / gridSize)) + 1) {
            graphics.moveTo(x * gridSize, 0);
            graphics.lineTo(x * gridSize, cy);
        }
        
        for (y in 0...Std.int((cy / gridSize)) + 1) {
            graphics.moveTo(0, y * gridSize);
            graphics.lineTo(cx, y * gridSize);
        }
    }
}