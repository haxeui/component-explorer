package views;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/listviews.xml"))
class ListViewsView extends View {
    public function new() {
        super();
    }
    
    @:bind(addItems1, MouseEvent.CLICK)
    function onAddItems1(e) {
        lv1.dataSource.allowCallbacks = false; // speeds things up a little
        for (i in 0...100) {
            lv1.dataSource.add({
                text: "Item " + (lv1.dataSource.size + 1)
            });
        }
        lv1.dataSource.allowCallbacks = true;
    }
    
    @:bind(addItems2, MouseEvent.CLICK)
    function onAddItems2(e) {
        lv2.dataSource.allowCallbacks = false; // speeds things up a little
        for (i in 0...100) {
            lv2.dataSource.add({
                item: "Item " + (lv2.dataSource.size + 1),
                complete: true,
                image: "haxeui-core/styles/default/haxeui_tiny.png"
            });
        }
        lv2.dataSource.allowCallbacks = true;
    }
    
    @:bind(addVirtualItems1, MouseEvent.CLICK)
    function onAddVirtualItems1(e) {
        virtualList1.dataSource.allowCallbacks = false; // speeds things up a little
        for (i in 0...100000) {
            virtualList1.dataSource.add({
                item: "Item " + (virtualList1.dataSource.size + 1),
                complete: true,
                image: "haxeui-core/styles/default/haxeui_tiny.png"
            });
        }
        virtualList1.dataSource.allowCallbacks = true;
    }
}