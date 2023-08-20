package windows;

import haxe.ui.containers.VBox;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.events.MouseEvent;
import haxe.ui.containers.windows.Window;

using haxe.ui.animation.AnimationTools;

@:xml(
    <window title="Inline Dialogs" width="400" height="300">
        <hbox>
            <button text="Info" onclick="messageBox('Info message content\n\nSomething else', 'Info', 'info')" icon="haxeui-core/styles/shared/info-small.png" />
            <button text="Question" onclick="messageBox('Question message content\n\nSomething else', 'Question', 'question')" icon="haxeui-core/styles/shared/help-small.png" />
            <button text="Warning" onclick="messageBox('Warning message content\n\nSomething else', 'Warning', 'warning')" icon="haxeui-core/styles/shared/warning-small.png" />
            <button text="Error" onclick="messageBox('Error message content\n\nSomething else', 'Error', 'error')" icon="haxeui-core/styles/shared/error-small.png" />
        </hbox>
        <button id="validatingDialog" text="Validating Dialog" />
    </window>
)
class InlineDialogsWindow extends Window {
    @:bind(validatingDialog, MouseEvent.CLICK)
    private function onValidatingDialog(_) {
        var dialog = new SimpleLoginDialog();
        #if !haxeui_hxwidgets  dialog.dialogParent = findComponent("windowContent", VBox); #end
        dialog.showDialog();
    }
}

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/simple-login-dialog.xml"))
class SimpleLoginDialog extends Dialog {
    public function new() {
        super();
        buttons = DialogButton.CANCEL | "Login";
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
                this.shake();
            }
        }
        fn(valid);
    }
}