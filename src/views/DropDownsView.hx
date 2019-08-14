package views;

import haxe.ui.components.DropDown.DropDownHandler;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/dropdowns.xml"))
class DropDownsView extends View {
    public function new() {
        super();
        
        // TODO: make this better
        //DropDownBuilder.HANDLER_MAP.set("custom", Type.getClassName(CustomDropDownHandler));
    }
}

// todo
/*
class CustomDropDownHandler extends DropDownHandler {
}
*/