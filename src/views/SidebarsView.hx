package views;
import haxe.ui.containers.SideBar;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/sidebars.xml"))
class SidebarsView extends View {
    public function new() {
        super();
    }
    
    @:bind(showSideBar1, MouseEvent.CLICK)
    private function onShowSideBar1(_) {
        var sidebar:SideBar = null;
        
        if (showSideBarLeft.selected == true) {
            sidebar = new MySideBar1();
            sidebar.position = "left";
        } else if (showSideBarRight.selected == true) {
            sidebar = new MySideBar1();
            sidebar.position = "right";
        } else if (showSideBarTop.selected == true) {
            sidebar = new MySideBar2();
            sidebar.position = "top";
        } else if (showSideBarBottom.selected == true) {
            sidebar = new MySideBar2();
            sidebar.position = "bottom";
        }
        
        if (sideBarShift.selected == true) {
            sidebar.method = "shift";
        } else if (sideBarSquash.selected == true) {
            sidebar.method = "squash";
        } else if (sideBarFloat.selected == true) {
            sidebar.method = "float";
        }
        
        sidebar.modal = sideBarModal.selected;
        
        sidebar.show();
    }
}

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/mysidebar.xml"))
class MySideBar1 extends SideBar {
    public function new() {
        super();
        width = 250;
        percentHeight = 100;
    }
}


@:build(haxe.ui.macros.ComponentMacros.build("assets/views/mysidebar.xml"))
class MySideBar2 extends SideBar {
    public function new() {
        super();
        percentWidth = 100;
        height = 250;
    }
}