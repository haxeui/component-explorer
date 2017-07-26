package views;

import haxe.ui.core.Component;

@:build(haxe.ui.macros.ComponentMacros.build("assets/ui/views/boxes.xml"))
class Boxes extends Component {
    public function new() {
        super();
        this.styleString = "width: 100%;";
    }
}