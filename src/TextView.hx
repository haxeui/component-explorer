package;
import haxe.ui.components.TextArea;
import haxe.ui.containers.VBox;

class TextView extends VBox {
    private var _ta:TextArea;
    
    public function new() {
        super();
        
        _ta = new TextArea();
        _ta.percentWidth = 100;
        _ta.percentHeight = 100;
        addComponent(_ta);
    }
    
    public var textContent(get, set):String;
    private function get_textContent():String {
        return _ta.text;
    }
    private function set_textContent(value:String):String {
        _ta.text = value;
        return value;
    }
}