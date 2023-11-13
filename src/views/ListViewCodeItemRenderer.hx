package views;

import haxe.ui.events.ItemEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/listview-code-item-renderer.xml"))
class ListViewCodeItemRenderer extends View {
    public function new() {
        super();
    }

    @:bind(lv1, ItemEvent.COMPONENT_CLICK_EVENT)
    private function onItemEventClick(event:ItemEvent) {
        var item = lv1.dataSource.get(event.itemIndex);
        switch (event.sourceEvent.target.id) {
            case "theButton":
                if (event.sourceEvent.target.text == "Activate") {
                    item.active = "true";
                } else if (event.sourceEvent.target.text == "Deactivate") {
                    item.active = "false";
                }
                lv1.dataSource.update(event.itemIndex, item);
                lv1.invalidateComponentData();
            case "theDeleteButton":
                lv1.dataSource.removeAt(event.itemIndex);
                lv1.invalidateComponentData();
        }
    }
}
