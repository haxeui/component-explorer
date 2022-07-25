package views;
import haxe.ui.containers.dialogs.Dialog;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/custom-component.xml"))
class CustomComponentView extends View {
    public function new() {
        super();
    }
}

@:xml('
<dialog title="Custom Component In Dialog" width="600" height="600" styleName="no-padding">
    <iframe url="http://haxeui.org" width="100%" height="100%" />
</dialog>
')
class CustomComponentDialog extends Dialog {
    public function new() {
        super();
        modal = false;
        buttons = DialogButton.CLOSE;
    }
}