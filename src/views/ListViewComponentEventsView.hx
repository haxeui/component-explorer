package views;

import haxe.ui.events.ItemEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/listview-component-events.xml"))
class ListViewComponentEventsView extends View {
    public function new() {
        super();
    }

    @:bind(lv1, ItemEvent.COMPONENT_CHANGE_EVENT)
    private function onItemEventChange(event:ItemEvent) {
        log.text += 'change > index: ${event.itemIndex}, component: ${event.source.id}, value: ${event.source.value}\n';
    }

    @:bind(lv1, ItemEvent.COMPONENT_CLICK_EVENT)
    private function onItemEventClick(event:ItemEvent) {
        log.text += 'click > index: ${event.itemIndex}, component: ${event.source.id}, value: ${event.source.value}\n';
    }
}