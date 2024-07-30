package views;

import haxe.ui.components.Image;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/scrollviews-empty-contents.xml"))
class ScrollViewsEmptyContentsView extends View {
    @:bind(addItemsScrollViewButton, MouseEvent.CLICK)
    private function onAddItemsScrollViewButton(_) {
        for (_ in 0...10) {
            var image = new Image();
            image.resource = "haxeui-core/styles/default/haxeui.png";
            scrollview1Contents.addComponent(image);
            scrollview2Contents.addComponent(image.cloneComponent());
            scrollview3Contents.addComponent(image.cloneComponent());
        }
    }

    @:bind(removeItemsScrollViewButton, MouseEvent.CLICK)
    private function onRemoveItemsScrollViewButton(_) {
        scrollview1Contents.removeAllComponents();
        scrollview2Contents.removeAllComponents();
        scrollview3Contents.removeAllComponents();
    }

    @:bind(addItemsListViewButton, MouseEvent.CLICK)
    private function onAddItemsListViewButton(_) {
        for (_ in 0...10) {
            listview1.dataSource.add({text: "Item " + Std.random(0xff)});
            listview2.dataSource.add({text: "Item " + Std.random(0xff)});
            listview3.dataSource.add({text: "Item " + Std.random(0xff)});
        }
    }

    @:bind(removeItemsListViewButton, MouseEvent.CLICK)
    private function onRemoveItemsListViewButton(_) {
        listview1.dataSource.removeAll();
        listview2.dataSource.removeAll();
        listview3.dataSource.removeAll();
    }

    @:bind(addItemsTableViewButton, MouseEvent.CLICK)
    private function onAddItemsTableViewButton(_) {
        for (_ in 0...10) {
            tableview1.dataSource.add({colA: "A" + Std.random(0xff)});
            tableview2.dataSource.add({colA: "A " + Std.random(0xff)});
            tableview3.dataSource.add({colA: "A " + Std.random(0xff)});
        }
    }

    @:bind(removeItemsTableViewButton, MouseEvent.CLICK)
    private function onRemoveItemsTableViewButton(_) {
        tableview1.dataSource.removeAll();
        tableview2.dataSource.removeAll();
        tableview3.dataSource.removeAll();
    }
}