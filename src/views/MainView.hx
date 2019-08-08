package views;

import haxe.ui.containers.Box;
import haxe.ui.data.ListDataSource;
import haxe.ui.events.UIEvent;
import views.ViewManager.ViewInfo;

@:build(haxe.ui.macros.ComponentMacros.build("assets/main.xml"))
class MainView extends Box {
    public function new() {
        super();
        
        ViewManager.instance.viewTabs = viewTabs;
        
        percentWidth = 100;
        percentHeight = 100;
        
        ViewManager.instance.registerView({ title: "Buttons", smallIcon: "icons/16/buttons.png", largeIcon: "icons/32/buttons.png", viewClass: ButtonsView, relevantFiles: ["views/buttons.xml"] });
        ViewManager.instance.registerView({ title: "Check Boxes", smallIcon: "icons/16/check_boxes.png", largeIcon: "icons/32/check_boxes.png", viewClass: CheckBoxesView, relevantFiles: ["views/checkboxes.xml"] });
        ViewManager.instance.registerView({ title: "Option Boxes", smallIcon: "icons/16/radio_button.png", largeIcon: "icons/32/radio_button.png", viewClass: OptionBoxesView, relevantFiles: ["views/optionboxes.xml"] });
        ViewManager.instance.registerView({ title: "Labels", smallIcon: "icons/16/labels(2).png", largeIcon: "icons/32/labels(2).png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Text Inputs", smallIcon: "icons/16/text_area(2).png", largeIcon: "icons/32/text_area(2).png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Scroll Views", smallIcon: "icons/16/scroll_pane_text_image.png", largeIcon: "icons/32/scroll_pane_text_image.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Calendars", smallIcon: "icons/16/data_field.png", largeIcon: "icons/32/data_field.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Progress Bars", smallIcon: "icons/16/progressbar.png", largeIcon: "icons/32/progressbar.png", viewClass: ProgressBarsView, relevantFiles: ["views/progessbars.xml"] });
        ViewManager.instance.registerView({ title: "Dropdowns", smallIcon: "icons/16/menu_item.png", largeIcon: "icons/32/menu_item.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Menus", smallIcon: "icons/16/menu.png", largeIcon: "icons/32/menu.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Scroll Bars", smallIcon: "icons/16/scroll_bar_horizontal.png", largeIcon: "icons/32/scroll_bar_horizontal.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Sliders", smallIcon: "icons/16/seek_bar_050.png", largeIcon: "icons/32/seek_bar_050.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Images", smallIcon: "icons/16/images_flickr.png", largeIcon: "icons/32/images_flickr.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Steppers", smallIcon: "icons/16/spin.png", largeIcon: "icons/32/spin.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Switches", smallIcon: "icons/16/button_toggle.png", largeIcon: "icons/32/button_toggle.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Tabs", smallIcon: "icons/16/tab_content.png", largeIcon: "icons/32/tab_content.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Dialogs", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        
        ViewManager.instance.registerView({ title: "Absolute Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Box Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Horizontal Layouts", smallIcon: "icons/16/layouts_3.png", largeIcon: "icons/32/layouts_3.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Vertical Layouts", smallIcon: "icons/16/layouts_4.png", largeIcon: "icons/32/layouts_4.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Grid Layouts", smallIcon: "icons/16/layouts_6.png", largeIcon: "icons/32/layouts_6.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        ViewManager.instance.registerView({ title: "Table Views", smallIcon: "icons/16/table.png", largeIcon: "icons/32/table.png", viewClass: PlaceholderView, relevantFiles: ["views/placeholder.xml"] });
        
        populateViewList();
    }
    
    @:bind(viewList, UIEvent.CHANGE)
    private function onViewListChange(e) {
        ViewManager.instance.showView(viewList.selectedItem);
    }
    
    private function populateViewList() {
        var ds = new ListDataSource<ViewInfo>();
        for (v in ViewManager.instance.views) {
            ds.add(v);
        }
        viewList.dataSource = ds;
    }
}