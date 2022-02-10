package views;
import haxe.ui.dragdrop.DragManager;
import haxe.ui.geom.Rectangle;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/drag-manager.xml"))
class DragManagerView extends View {
    public function new() {
        super();
    }
    
    public override function onReady() {
        super.onReady();
        DragManager.instance.registerDraggable(box2, {
            mouseTarget: mouseTargetBox2
        });
        
        DragManager.instance.registerDraggable(box3, {
            dragBounds: new Rectangle(0, 0, 600, 300)
        });
    }
}