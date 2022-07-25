package views;

import haxe.ui.components.Button;
import haxe.ui.containers.Box;
import haxe.ui.containers.VBox;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.events.MouseEvent;
import haxe.ui.events.UIEvent;
import haxe.ui.geom.Point;
import haxe.ui.util.Color;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/simple-paint.xml"))
class SimplePaintView extends View {
    private var _toolbox:ToolBox = new ToolBox();
    
    private override function onReady() {
        super.onReady();
        _toolbox.left = canvasContainer.screenLeft + canvasContainer.width - 120;
        _toolbox.top = canvasContainer.screenTop + 20;
        _toolbox.show();
    }
    
    @:bind(_toolbox, UIEvent.CHANGE)
    private function onToolChanged(_) {
        canvas.componentGraphics.strokeStyle(_toolbox.currentColor, _toolbox.currentThickness);
    }
    
    private var _downPos:Point = null;
    @:bind(canvas, MouseEvent.MOUSE_DOWN)
    private function onCanvasMouseDown(event:MouseEvent) {
        _downPos = new Point(event.localX, event.localY);
        canvas.componentGraphics.moveTo(_downPos.x, _downPos.y);
    }

    @:bind(canvas, MouseEvent.MOUSE_MOVE)
    private function onCanvasMouseMove(event:MouseEvent) {
        if (_downPos == null) {
            return;
        }
        canvas.componentGraphics.lineTo(event.localX, event.localY);
        _downPos = new Point(event.localX, event.localY);
    }
    
    @:bind(canvas, MouseEvent.MOUSE_UP)
    private function onCanvasMouseUp(event:MouseEvent) {
        _downPos = null;
    }
    
    private override function onHidden() {
        _toolbox.hideDialog(DialogButton.CANCEL);
    }
}

@:xml('
<dialog title="Colors" closable="false" modal="false">
    <style>
        .color-button {
            width: 32px;
            height: 32px;
            padding: 4px;
            border: none;
            background-color: none;
        }
        
        .color-button:down {
            background-color: $accent-color;
        }
        
        .color-button .box {
            width: 24px;
            height: 24px;
            border: 1px solid black;
        }
    </style>
    <grid id="colorGrid" style="spacing:0px;">
    </grid>
    
    <dropdown id="thicknessSelector" width="100%" dropdownSize="-1" selectedIndex="1">
        <data>
            <item text="1" />
            <item text="2" />
            <item text="3" />
            <item text="4" />
            <item text="5" />
        </data>
    </dropdown>
</dialog>
')
private class ToolBox extends Dialog {
    public var currentColor:Color = "#000000";
    public var currentThickness:Float = 2;
    
    public function new() {
        super();
        colorGrid.addComponent(createColorButton("#000000", true));
        colorGrid.addComponent(createColorButton("#ffffff"));
        colorGrid.addComponent(createColorButton("#7f7f7f"));
        colorGrid.addComponent(createColorButton("#c3c3c3"));
        colorGrid.addComponent(createColorButton("#880015"));
        colorGrid.addComponent(createColorButton("#b97a57"));
        colorGrid.addComponent(createColorButton("#ed1c24"));
        colorGrid.addComponent(createColorButton("#ffaec9"));
        colorGrid.addComponent(createColorButton("#ff7f27"));
        colorGrid.addComponent(createColorButton("#ffc90e"));
        colorGrid.addComponent(createColorButton("#fff200"));
        colorGrid.addComponent(createColorButton("#efe4b0"));
        colorGrid.addComponent(createColorButton("#22b14c"));
        colorGrid.addComponent(createColorButton("#b5e61d"));
        colorGrid.addComponent(createColorButton("#00a2e8"));
        colorGrid.addComponent(createColorButton("#99d9ea"));
        colorGrid.addComponent(createColorButton("#3f48cc"));
        colorGrid.addComponent(createColorButton("#7092be"));
        colorGrid.addComponent(createColorButton("#a349a4"));
        colorGrid.addComponent(createColorButton("#c8bfe7"));
    }
    
    private function createColorButton(color:String, selected:Bool = false) {
        var button = new Button();
        button.styleNames = "color-button";
        button.toggle = true;
        button.selected = selected;
        var box = new Box();
        box.backgroundColor = color;
        button.addComponent(box);
        button.registerEvent(MouseEvent.CLICK, onColorChanged);
        return button;
    }
    
    private function onColorChanged(event:MouseEvent) {
        for (button in colorGrid.findComponents("color-button", Button)) {
            if (button == event.target) {
                currentColor = button.findComponent(Box).backgroundColor;
                button.selected = true;
            } else {
                button.selected = false;
            }
        }
        dispatch(new UIEvent(UIEvent.CHANGE));
    }
    
    @:bind(thicknessSelector, UIEvent.CHANGE)
    private function onThicknessSelectorChanged(_) {
        currentThickness = Std.parseFloat(thicknessSelector.selectedItem.text);
        dispatch(new UIEvent(UIEvent.CHANGE));
    }
}