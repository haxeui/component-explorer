package views;

import haxe.ui.containers.Box;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/dialogs.xml"))
class DialogsView extends View {
    public function new() {
        super();
    }
    
    @:bind(customModalDialog, MouseEvent.CLICK)
    private function onCustomModalDialog(e) {
        var dialog = new MyCustomDialog();
        dialog.onDialogClosed = function(e:DialogEvent) {
            trace(e.button);
        }
        dialog.showDialog();
    }
    
    @:bind(customNonModalDialog, MouseEvent.CLICK)
    private function onCustomNonModalDialog(e) {
        var dialog = new MyCustomDialog();
        dialog.onDialogClosed = function(e:DialogEvent) {
            trace(e.button);
        }
        dialog.showDialog(false);
    }
}

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/mycustomdialog.xml"))
class MyCustomDialog extends Dialog {
    public function new() {
        super();
        title = "Entry Form";
        buttons = DialogButton.CANCEL | "Custom Button" | DialogButton.APPLY;
    }
}