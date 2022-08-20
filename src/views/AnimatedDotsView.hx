package views;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/animated-dots.xml"))
class AnimatedDotsView extends View {
    private var _currentDotIndex:Int = 0;
    
    public function new() {
        super();
    }
    
    @:bind(buttonPrev, MouseEvent.CLICK)
    private function onPrev(_) {
        var newIndex = _currentDotIndex - 1;
        if (newIndex < 0) {
            newIndex = theDots.childComponents.length - 1;
        }
        setDotIndex(newIndex);
    }
    
    @:bind(buttonNext, MouseEvent.CLICK)
    private function onNext(_) {
        var newIndex = _currentDotIndex + 1;
        if (newIndex > theDots.childComponents.length - 1) {
            newIndex = 0;
        }
        setDotIndex(newIndex);
    }
    
    private function setDotIndex(index:Int) {
        theDots.childComponents[_currentDotIndex].swapClass(':shrink', ':grow', true, true);
        _currentDotIndex = index;
        theDots.childComponents[_currentDotIndex].swapClass(':grow', ':shrink', true, true);
    }
}