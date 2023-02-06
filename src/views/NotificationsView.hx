package views;

import haxe.ui.notifications.NotificationType;
import haxe.ui.notifications.NotificationManager;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/notifications.xml"))
class NotificationsView extends View {
    @:bind(basicNotificationButton, MouseEvent.CLICK)
    private function onBasicNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Basic Notification",
            body: "This is a the most basic notification, will will expire in 2 seconds"
        });
    }

    @:bind(nonExpiringNotificationButton, MouseEvent.CLICK)
    private function onNonExpiringNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Non-Expiring Notification",
            body: "This notification will not expire, it must be manually dismissed by the user",
            expiryMs: -1
        });
    }

    @:bind(actionNotificationButton, MouseEvent.CLICK)
    private function onActionNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Notification With Actions",
            body: "This notification has some actions attached to it, its also implied that it will not expire",
            actions: ["Foo", "Bar"]
        });
    }

    @:bind(largeNotificationButton, MouseEvent.CLICK)
    private function onLargeNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Notification With Large Body",
            body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur laoreet egestas massa id posuere. Donec sit amet dolor pulvinar, euismod ante quis, semper sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent placerat eleifend condimentum. Ut ac ex non quam ultricies sollicitudin. Etiam eget volutpat tellus. Proin pulvinar convallis ex, ac tempor ligula bibendum in. Vestibulum et nibh a urna feugiat iaculis sit amet vitae nisi. Nulla facilisi. Nulla blandit mauris a risus tincidunt pharetra."
        });
    }

    @:bind(hugeNotificationButton, MouseEvent.CLICK)
    private function onHugeNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Notification With Huge Body",
            body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur laoreet egestas massa id posuere. Donec sit amet dolor pulvinar, euismod ante quis, semper sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent placerat eleifend condimentum. Ut ac ex non quam ultricies sollicitudin. Etiam eget volutpat tellus. Proin pulvinar convallis ex, ac tempor ligula bibendum in. Vestibulum et nibh a urna feugiat iaculis sit amet vitae nisi. Nulla facilisi. Nulla blandit mauris a risus tincidunt pharetra.\n\nNulla ullamcorper magna ac libero egestas tempor. Sed vitae placerat metus, et vehicula arcu. Pellentesque at risus id tellus dapibus rhoncus. Fusce non neque ut metus dapibus porta. Aliquam eget risus ornare, aliquet ex ut, scelerisque sapien. Praesent nibh nulla, egestas aliquet odio et, vestibulum auctor purus. Donec a nibh eget odio suscipit porttitor vitae eget ligula. Curabitur euismod urna massa, id hendrerit felis tristique vestibulum. Donec non condimentum massa. Maecenas metus augue, malesuada vitae faucibus tempor, sagittis in felis. Aliquam sit amet risus semper, tempor ligula a, tempus enim."
        });
    }

    @:bind(customIconNotificationButton, MouseEvent.CLICK)
    private function onCustomIconNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Notification With Custom Icon",
            body: "This notification has a custom icon, any icon can be used",
            icon: "haxeui-core/styles/default/haxeui_small.png"
        });
    }

    @:bind(defaultNotificationButton, MouseEvent.CLICK)
    private function onDefaultNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Default Notification",
            body: "This notification has the default styling applied to it."
        });
    }

    @:bind(infoNotificationButton, MouseEvent.CLICK)
    private function onInfoNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Info Notification",
            body: "This notification has the info styling applied to it.",
            type: NotificationType.Info
        });
    }

    @:bind(errorNotificationButton, MouseEvent.CLICK)
    private function onErrorNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Error Notification",
            body: "This notification has the error styling applied to it.",
            type: NotificationType.Error
        });
    }

    @:bind(warningNotificationButton, MouseEvent.CLICK)
    private function onWarningNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Warning Notification",
            body: "This notification has the warning styling applied to it.",
            type: NotificationType.Warning
        });
    }

    @:bind(successNotificationButton, MouseEvent.CLICK)
    private function onSuccessNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Success Notification",
            body: "This notification has the success styling applied to it.",
            type: NotificationType.Success
        });
    }

    @:bind(customNotificationButton, MouseEvent.CLICK)
    private function onCustomNotification(_) {
        NotificationManager.instance.addNotification({
            title: "Custom Styled Notification",
            body: "This notification has has been styled by css",
            styleNames: "custom-notification"
        });
    }
}