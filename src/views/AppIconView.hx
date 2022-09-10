package views;
import haxe.ui.HaxeUIApp;
import haxe.ui.events.MouseEvent;
import haxe.ui.util.Timer;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/app-icon.xml"))
class AppIconView extends View {
    private static inline var MAX_FRAMES = 92;
    private var _timer:Timer = null;
    
    @:bind(setIconButton, MouseEvent.CLICK)
    private function onSetIcon(_) {
        resetAppIcon();
        startStopButton.text = "Start";
        HaxeUIApp.instance.icon = iconList.selectedItem.icon;
        HaxeUIApp.instance.title = iconList.selectedItem.text;
    }
    
    @:bind(startStopButton, MouseEvent.CLICK)
    private function onStartStop(_) {
        if (startStopButton.text == "Start") {
            startStopButton.text = "Stop";
            resetAppIcon();
            HaxeUIApp.instance.title = "Loading";
            _timer = new Timer(60, frame);
        } else if (startStopButton.text == "Stop") {
            startStopButton.text = "Start";
            resetAppIcon();
        }
    }
    
    var _currentFrame:Int = 0;
    private function frame() {
        _currentFrame++;
        if (_currentFrame > MAX_FRAMES) {
            _currentFrame = 1;
        }
        HaxeUIApp.instance.icon = "icons/title-icon/frame-" + _currentFrame + ".png";
    }
    
    @:bind(resetIconButton, MouseEvent.CLICK)
    private function onResetIcon(_) {
        startStopButton.text = "Start";
        resetAppIcon();
    }
    
    private function resetAppIcon() {
        if (_timer != null) {
            _timer.stop();
            _timer = null;
        }
        HaxeUIApp.instance.icon = "haxeui-core/styles/default/haxeui_tiny.png";
        HaxeUIApp.instance.title = "Component Explorer - HaxeUI";
    }
    
    private override function onHidden() {
        resetAppIcon();
    }
}