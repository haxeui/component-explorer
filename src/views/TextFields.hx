package views;

import haxe.ui.core.Component;

@:build(haxe.ui.macros.ComponentMacros.build("assets/ui/views/textfields.xml"))
class TextFields extends Component {
    public function new() {
        super();
        this.styleString = "width: 100%;";
    }
}