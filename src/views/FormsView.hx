package views;

import haxe.ui.notifications.NotificationType;
import haxe.ui.notifications.NotificationManager;
import haxe.ui.events.UIEvent;
import haxe.ui.events.ValidatorEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/forms.xml"))
class FormsView extends View {
    @:bind(form4, ValidatorEvent.INVALID_DATA)
    private function onForm4InvalidData(event:ValidatorEvent) {
        if (form4.invalidFieldMessages.exists(username4)) {
            username4error.text = form4.invalidFieldMessages.get(username4).join("\n");
            username4error.show();
        }
        if (form4.invalidFieldMessages.exists(password4)) {
            password4error.text = form4.invalidFieldMessages.get(password4).join("\n");
            password4error.show();
        }
        if (form4.invalidFieldMessages.exists(system4)) {
            system4error.text = form4.invalidFieldMessages.get(system4).join("\n");
            system4error.show();
        }
    }

    @:bind(form4, UIEvent.SUBMIT_START)
    private function onForm4SubmitStart(event:UIEvent) {
        username4error.hide();
        password4error.hide();
        system4error.hide();
    }

    @:bind(form4, UIEvent.SUBMIT)
    private function onForm4Submit(event:UIEvent) {
        NotificationManager.instance.addNotification({
            title: "Form Submitted",
            body: "Login form submitted successfully!",
            type: NotificationType.Success
        });
    }
}