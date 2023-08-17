package views;

import haxe.ui.notifications.NotificationType;
import haxe.ui.notifications.NotificationManager;
import haxe.ui.containers.dialogs.CollapsibleDialog;
import haxe.ui.containers.Box;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.containers.dialogs.Dialogs;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import haxe.ui.events.MouseEvent;

using haxe.ui.animation.AnimationTools;

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

    @:bind(collapsibleDialog, MouseEvent.CLICK)
    private function onCollapsibleDialog(e) {
        var dialog = new MyCustomCollapsibleDialog();
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
    
    @:bind(noTitleDialog, MouseEvent.CLICK)
    private function onNoTitleDialog(e) {
        var dialog = new SimpleLoginDialog();
        dialog.addClass("no-title");
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

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/mycustomdialog.xml"))
class MyCustomCollapsibleDialog extends CollapsibleDialog {
    public function new() {
        super();
        //height = 400;
        buttons = DialogButton.CANCEL | "Custom Button" | DialogButton.APPLY;
    }
}

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/simple-login-dialog.xml"))
class SimpleLoginDialog extends Dialog {
    public function new() {
        super();
        buttons = DialogButton.CANCEL | "Login";
        #if !hxWidgets defaultButton = "Login"; #end
    }
    
    public override function validateDialog(button:DialogButton, fn:Bool->Void) {
        var valid = true;
        if (button == "Login") {
            if (username.text == "" || username.text == null) {
                username.flash();
                valid = false;
            } 
            if (password.text == "" || password.text == null) {
                password.flash();
                valid = false;
            }

            if (valid == false) {
                NotificationManager.instance.addNotification({
                    title: "Problem Logging In",
                    body: "There was a problem attempting to login, please try again.",
                    type: NotificationType.Error
                });
                this.shake();
            } else {
                NotificationManager.instance.addNotification({
                    title: "Log In Successful",
                    body: "Login successful! Welcome " + username.text + "!",
                    type: NotificationType.Success
                });
            }
        }
        fn(valid);
    }
}