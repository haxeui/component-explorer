package ;

import haxe.ui.HaxeUIApp;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import haxe.ui.editors.code.monaco.MonacoLoader;
import views.MainView;

class Main {
    public static function main() {
        new MonacoLoader().register(null);
        var app = new HaxeUIApp();
        app.ready(function() {
            var main = new MainView();
            app.addComponent(main);

            app.start();
        });
    }
}
