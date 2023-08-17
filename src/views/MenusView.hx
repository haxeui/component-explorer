package views;

import haxe.ui.core.Screen;
import haxe.ui.events.MouseEvent;
import haxe.ui.containers.menus.Menu;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/menus.xml"))
class MenusView extends View {
    public function new() {
        super();

        var root1 = tree1.addNode({ text: "root A", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
        root1.expanded = true;
            var child = root1.addNode({ text: "child A-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
            child.expanded = true;
                var node = child.addNode({ text: "child A-1-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                var node = child.addNode({ text: "child A-1-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                var node = child.addNode({ text: "child A-1-3", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    child.expanded = true;
                        var node = child.addNode({ text: "child A-2-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-2-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-3", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    child.expanded = true;
                        var node = child.addNode({ text: "child A-3-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-3-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-3-3", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-3-4", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-4", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-5", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
    }

    @:bind(menuTarget1, MouseEvent.RIGHT_MOUSE_DOWN)
    @:bind(menuTarget2, MouseEvent.MOUSE_DOWN)
    private function onMenuTarget(e:MouseEvent) {
        var menu = new MyMenu();
        menu.left = e.screenX;
        menu.top = e.screenY;
        Screen.instance.addComponent(menu);
    }

    #if !hxWidgets
    @:bind(tv1, MouseEvent.RIGHT_MOUSE_DOWN)
    #end
    @:bind(lv1, MouseEvent.RIGHT_MOUSE_DOWN)
    @:bind(tree1, MouseEvent.RIGHT_MOUSE_DOWN)
    private function onComponentRightDown(e:MouseEvent) {
        var menu = new CutCopyPasteMenu();
        menu.left = e.screenX + 1;
        menu.top = e.screenY + 1;
        Screen.instance.addComponent(menu);
    }
}

@:xml('
<menu>
    <menu-item text="Item 1" />
    <menu-item text="Item 2" />
    <menu text="Item 3">
        <menu-item text="Sub Item 3A" />
        <menu-item text="Sub Item 3B" />
        <menu-item text="Sub Item 3C" />
    </menu>
    <menu-item text="Item 4" />
    <menu-item text="Item 5" />
</menu>
')
class MyMenu extends Menu {
}

@:xml('
<menu>
    <menu-item text="Cut" icon="icons/actions/cut.png" />
    <menu-item text="Copy" icon="icons/actions/copy.png" />
    <menu-item text="Paste" icon="icons/actions/paste.png" />
    <menu-separator />
    <menu-item text="Delete" icon="icons/actions/delete.png" />
</menu>
')
class CutCopyPasteMenu extends Menu {
}