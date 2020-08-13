package views;

import haxe.ui.components.DropDown.DropDownBuilder;
import haxe.ui.components.DropDown.DropDownEvents;
import haxe.ui.components.DropDown.DropDownHandler;
import haxe.ui.core.Component;
import haxe.ui.core.Screen;
import haxe.ui.events.UIEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/dropdowns.xml"))
class DropDownsView extends View {
    public function new() {
        super();
        
        // TODO: make this better
        DropDownBuilder.HANDLER_MAP.set("myDropDownHandler", Type.getClassName(MyDropDownHandler));
    }
}

// TODO: improve api, could be simpler
@:access(haxe.ui.core.Component)
class MyDropDownHandler extends DropDownHandler {
    private var _view:MyDropDownHandlerView = null;
    
    private override function get_component():Component {
        if (_view == null) {
            _view = new MyDropDownHandlerView();
            _view.applyButton.onClick = function(e) {
                var items = [];
                // just for demo purposes
                if (_view.checkbox1.selected == true) {
                    items.push("checkbox1");
                }
                if (_view.checkbox2.selected == true) {
                    items.push("checkbox2");
                }
                if (_view.checkbox3.selected == true) {
                    items.push("checkbox3");
                }
                if (_view.optionbox1.selected == true) {
                    items.push("optionbox1");
                }
                if (_view.optionbox2.selected == true) {
                    items.push("optionbox2");
                }
                if (_view.optionbox3.selected == true) {
                    items.push("optionbox3");
                }
                
                if (items.length == 0) {
                    _dropdown.text = "Select Item(s)";
                } else {
                    _dropdown.text = items.join(", ");
                }
                
                cast(_dropdown._internalEvents, DropDownEvents).hideDropDown();
                _dropdown.dispatch(new UIEvent(UIEvent.CHANGE));
            }
        }
        return _view;
    }
    
    /*
    public override function show() {
        Screen.instance.addComponent(_view);
    }
    */
}
