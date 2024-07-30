package views;

import haxe.ui.events.NotificationEvent;
import haxe.ui.notifications.NotificationData.NotificationActionData;
import haxe.ui.notifications.NotificationManager;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/notification-action-events.xml"))
class NotificationActionEventsView extends View {
    @:bind(actionNotificationEventButton, MouseEvent.CLICK)
    private function onActionNotificationEvents(_) {
        actionNotificationEventLabel.text = "";
        NotificationManager.instance.addNotification({
            title: "Notification With Actions",
            body: "This notification has some actions attached to it, its also implied that it will not expire",
            actions: [{
                text: "Foo"
            }, {
                text: "Bar"
            }]
        });
    }

    @:bind(NotificationManager.instance, NotificationEvent.ACTION)
    private function onNotificationManagerAction(event:NotificationEvent) {
        var actionData = event.actionData;
        actionNotificationEventLabel.text = "You chose " + actionData.text + "!";
    }

    @:bind(actionNotificationCallbackButton, MouseEvent.CLICK)
    private function onActionNotificationCallback(_) {
        actionNotificationCallbackLabel.text = "";
        NotificationManager.instance.addNotification({
            title: "Notification With Actions",
            body: "This notification has some actions attached to it, its also implied that it will not expire",
            actions: [{
                text: "Foo",
                callback: onNotificationActionCallback
            }, {
                text: "Bar",
                callback: onNotificationActionCallback
            }]
        });
    }
    
    private function onNotificationActionCallback(actionData:NotificationActionData) {
        actionNotificationCallbackLabel.text = "You chose " + actionData.text + "!";
        return true; // return value indicates if the notification should close or not
    }
}