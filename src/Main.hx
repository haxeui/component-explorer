package ;

import haxe.ui.HaxeUIApp;
import views.MainView;

class Main {
    public static function main() {
        var options = null;
        
        #if js
            var container = js.Browser.window.document.getElementById("haxeui-container");
            if (container != null) {
                options = {
                    container: container
                }
            }
        #end
        
        var app = new HaxeUIApp(options);
        app.ready(function() {
            var main = new MainView();
            app.addComponent(main);

            app.start();
        });
    }
}
