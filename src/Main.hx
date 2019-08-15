package ;

import haxe.ui.HaxeUIApp;
import views.MainView;

class Main {
    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {
            var main = new MainView();
            app.addComponent(main);

            app.start();
        });
    }
}
