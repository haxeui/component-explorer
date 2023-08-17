package views.fakeemployeeapp;

import haxe.ui.util.Timer;
import haxe.ui.containers.VBox;
import haxe.ui.containers.dialogs.Dialog;
import haxe.ui.events.MouseEvent;
import haxe.ui.containers.windows.Window;

@:xml('
<window title="Email" width="410" height="400" left="30" top="30">
    <grid width="100%">
        <label text="From:" verticalAlign="center" styleName="field-label" />
        <link text="somewhere@there.com" width="100%" />

        <label text="To:" verticalAlign="center" styleName="field-label" />
        <textfield id="toField" width="100%" />

        <label text="Subject: " verticalAlign="center" styleName="field-label" />
        <textfield id="subjectField" width="100%" />
    </grid>
    <textarea width="100%" height="100%" text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae leo ut dolor maximus pharetra sed at tortor. Phasellus sed nunc nec lorem sagittis dictum. Praesent leo urna, mollis ac ipsum nec, lobortis rutrum tortor. Fusce suscipit convallis elit, eget rutrum dolor blandit quis. Donec efficitur congue elit, sit amet tincidunt nisi sagittis vitae. Vivamus auctor nisl nec odio vestibulum, finibus consectetur eros pellentesque. Aliquam in sem in nulla scelerisque mattis et quis lorem.\n\nVestibulum nec nulla vitae leo imperdiet rhoncus. Suspendisse in purus sit amet odio bibendum varius. Nulla facilisi. Mauris maximus turpis ut fermentum dictum. Donec pharetra rhoncus ex et tincidunt. Etiam pellentesque fermentum bibendum. Aenean consequat ligula ex, vitae viverra est varius a. Integer non elementum mi. Nullam egestas est semper tellus consequat malesuada. Phasellus tincidunt lacus felis, vitae lobortis tellus mattis a. Donec fringilla lacus id venenatis auctor.\n\nAenean fermentum fermentum eros. Maecenas et magna nisl. Mauris a nisl a turpis congue pharetra et quis nunc. Sed suscipit scelerisque turpis, sit amet aliquet dui sollicitudin id. In ut neque sit amet ligula venenatis interdum. Fusce ornare dolor nisi, nec sollicitudin ex tempor a. Sed mattis tincidunt justo, non dictum metus accumsan ut. Nulla vel laoreet magna." />
    <window-footer>
        <spacer width="100%" />
        <button id="cancelButton" text="Cancel" />
        <button id="sendButton" text="Send" />
    </window-footer>
</window>
')
class FakeEmailWindow extends Window {
    public var to(get, set):String;
    private function get_to():String {
        return toField.text;
    }
    private function set_to(value:String):String {
        toField.text = value;
        return value;
    }
    
    public var subject(get, set):String;
    private function get_subject():String {
        return subjectField.text;
    }
    private function set_subject(value:String):String {
        subjectField.text = value;
        return value;
    }

    @:bind(cancelButton, MouseEvent.CLICK)
    private function onCancel(_) {
        windowManager.closeWindow(this);
    }

    @:bind(sendButton, MouseEvent.CLICK)
    private function onSend(_) {
        cancelButton.disabled = true;
        sendButton.disabled = true;
        var waiting = new FakeSendDialog();
        #if !hxWidgets
        waiting.dialogParent = findComponent("windowContent", VBox);
        #end
        waiting.show();
        Timer.delay(() -> {
            cancelButton.disabled = false;
            sendButton.disabled = false;
            waiting.hide();
            windowManager.closeWindow(this);
        }, 3000);
    }
}

@:xml('
    <dialog title="Please Wait" closable="false">
        <image resource="images/preloader.png" horizontalAlign="center" />
        <label text="Sending email, please wait..." />
    </dialog>
')
private class FakeSendDialog extends Dialog {
    public function new() {
        super();
        #if !hxWidgets
        dialogTitle.hide();
        #end
    }
}