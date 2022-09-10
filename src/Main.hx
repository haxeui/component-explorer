package ;

import haxe.ui.HaxeUIApp;
import views.MainView;
import custom.Preloader;

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
