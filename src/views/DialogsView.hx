package views;

import haxe.ui.containers.Box;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.containers.dialogs.Dialogs;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
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
    
    @:bind(validatingDialog, MouseEvent.CLICK)
    private function onValidatingDialog(e) {
        var dialog = new SimpleLoginDialog();
        dialog.onDialogClosed = function(e:DialogEvent) {
            trace(e.button);
        }
        dialog.showDialog();
    }
}

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/mycustomdialog.xml"))
class MyCustomDialog extends Dialog {
    public function new() {
        super();
        buttons = DialogButton.CANCEL | "Custom Button" | DialogButton.APPLY;
    }
}

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/simple-login-dialog.xml"))
class SimpleLoginDialog extends Dialog {
    public function new() {
        super();
        buttons = DialogButton.CANCEL | "Login";
    }
    
    public override function validateDialog(button:DialogButton, fn:Bool->Void) {
        if (button == "Login") {
            if (username.text == "" || username.text == null) {
                Dialogs.messageBox("Username is required!", "Missing Username", MessageBoxType.TYPE_WARNING);
                fn(false);
            } else if (password.text == "" || password.text == null) {
                Dialogs.messageBox("Password is required!", "Missing Password", MessageBoxType.TYPE_WARNING);
                fn(false);
            } else {
                fn(true);
            }
        } else {
            fn(true);
        }
    }
}