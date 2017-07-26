package views.layouts;

import haxe.ui.core.Component;

@:build(haxe.ui.macros.ComponentMacros.build("assets/ui/views/horizontal.xml"))
class Horizontal extends Component {
    public function new() {
        super();
        this.styleString = "width: 100%;";
    }
}