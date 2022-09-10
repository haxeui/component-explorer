package views;

import haxe.ui.events.MouseEvent;

using haxe.ui.animation.AnimationTools;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/animation.xml"))
class AnimationView extends View {
    public function new() {
        super();
    }
    
    @:bind(shakeHorizontally, MouseEvent.CLICK)
    private function onShakeHorizontally(_) {
        animationTarget1.shake();
    }
    
    @:bind(shakeVertically, MouseEvent.CLICK)
    private function onShakeVertically(_) {
        animationTarget1.shake("vertical");
    }
    
    @:bind(shakeBoth, MouseEvent.CLICK)
    private function onShakeBoth(_) {
        animationTarget1.shake("both");
    }
    
    @:bind(flashDefault, MouseEvent.CLICK)
    private function onFlash(_) {
        animationTarget1.flash();
    }
    
    @:bind(flashBlue, MouseEvent.CLICK)
    private function onFlashBlue(_) {
        animationTarget1.flash(0xd9e5f2);
    }
    
    @:bind(chain, MouseEvent.CLICK)
    private function onChain(_) {
        animationTarget1.shake().shake("vertical").flash();
    }
}