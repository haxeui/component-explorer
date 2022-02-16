package ;

import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import views.MainView;

class Main {
    public static function main() {
        #if js
        new haxe.ui.editors.code.monaco.MonacoLoader().register(null);
        #end
        //var dark = Browser.window.matchMedia('(prefers-color-scheme: dark)').matches;
        //if (dark == true) {
        //    Toolkit.theme = "dark2";
        //}
        
        //
        var app = new HaxeUIApp();
        app.ready(function() {
            var main = new MainView();
            app.addComponent(main);

            app.start();
        });
    }
}
