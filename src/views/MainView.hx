package views;

import haxe.ui.containers.Box;
import haxe.ui.containers.HBox;
import haxe.ui.core.Screen;
import haxe.ui.data.ListDataSource;
import haxe.ui.events.MouseEvent;
import haxe.ui.events.UIEvent;
import haxe.ui.util.Timer;
import util.Logger;
import views.CardsView;
import views.FramesView;
import views.LinksView;
import views.SplitterView;
import views.TreeViewsView;
import views.ViewManager.ViewInfo;

@:build(haxe.ui.macros.ComponentMacros.build("assets/main.xml"))
class MainView extends HBox {
    public function new() {
        super();
        
        Logger.logData = logData;
        ViewManager.instance.viewTabs = mainTabs;
        
        ViewManager.instance.registerView({ title: "Buttons", smallIcon: "icons/16/buttons.png", largeIcon: "icons/32/buttons.png", viewClass: ButtonsView, relevantFiles: ["views/buttons.xml"] });
        ViewManager.instance.registerView({ title: "Check Boxes", smallIcon: "icons/16/check_boxes.png", largeIcon: "icons/32/check_boxes.png", viewClass: CheckBoxesView, relevantFiles: ["views/checkboxes.xml"] });
        ViewManager.instance.registerView({ title: "Option Boxes", smallIcon: "icons/16/radio_button.png", largeIcon: "icons/32/radio_button.png", viewClass: OptionBoxesView, relevantFiles: ["views/optionboxes.xml"] });
        ViewManager.instance.registerView({ title: "Labels", smallIcon: "icons/16/labels(2).png", largeIcon: "icons/32/labels(2).png", viewClass: LabelsView, relevantFiles: ["views/labels.xml"] });
        ViewManager.instance.registerView({ title: "Links", smallIcon: "icons/16/labels.png", largeIcon: "icons/32/labels.png", viewClass: LinksView, relevantFiles: ["views/links.xml"] });
        ViewManager.instance.registerView({ title: "List Views", smallIcon: "icons/16/list_box.png", largeIcon: "icons/32/list_box.png", viewClass: ListViewsView, relevantFiles: ["views/listviews.xml", "src/views/ListViewsView.hx"] });
        ViewManager.instance.registerView({ title: "Table Views", smallIcon: "icons/16/table.png", largeIcon: "icons/32/table.png", viewClass: TableViewsView, relevantFiles: ["views/tableviews.xml"] });
        ViewManager.instance.registerView({ title: "Tree Views", smallIcon: "icons/16/labels.png", largeIcon: "icons/32/labels.png", viewClass: TreeViewsView, relevantFiles: ["views/treeviews.xml"] });
        ViewManager.instance.registerView({ title: "Cards", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: CardsView, relevantFiles: ["views/cards.xml"] });
        ViewManager.instance.registerView({ title: "Property Grids", smallIcon: "icons/16/attributes_display.png", largeIcon: "icons/32/attributes_display.png", viewClass: PropertyGridsView, relevantFiles: ["views/propertygrids.xml"] });
        ViewManager.instance.registerView({ title: "Frames", smallIcon: "icons/16/attributes_display.png", largeIcon: "icons/32/attributes_display.png", viewClass: FramesView, relevantFiles: ["views/frames.xml"] });
        ViewManager.instance.registerView({ title: "Text Inputs", smallIcon: "icons/16/text_area(2).png", largeIcon: "icons/32/text_area(2).png", viewClass: TextInputsView, relevantFiles: ["views/textinputs.xml"] });
        ViewManager.instance.registerView({ title: "Scroll Views", smallIcon: "icons/16/scroll_pane_text_image.png", largeIcon: "icons/32/scroll_pane_text_image.png", viewClass: ScrollViewsView, relevantFiles: ["views/scrollviews.xml"] });
        ViewManager.instance.registerView({ title: "Calendars", smallIcon: "icons/16/data_field.png", largeIcon: "icons/32/data_field.png", viewClass: CalendarsView, relevantFiles: ["views/calendars.xml"] });
        ViewManager.instance.registerView({ title: "Progress Bars", smallIcon: "icons/16/progressbar.png", largeIcon: "icons/32/progressbar.png", viewClass: ProgressBarsView, relevantFiles: ["views/progressbars.xml"] });
        ViewManager.instance.registerView({ title: "Dropdowns", smallIcon: "icons/16/menu_item.png", largeIcon: "icons/32/menu_item.png", viewClass: DropDownsView, relevantFiles: ["views/dropdowns.xml", "src/views/DropDownsView.hx", "views/mydropdownhandler.xml", "src/views/MyDropDownHandlerView.hx"] });
        ViewManager.instance.registerView({ title: "Menus", smallIcon: "icons/16/menu.png", largeIcon: "icons/32/menu.png", viewClass: MenusView, relevantFiles: ["views/menus.xml"] });
        ViewManager.instance.registerView({ title: "Scroll Bars", smallIcon: "icons/16/scroll_bar_horizontal.png", largeIcon: "icons/32/scroll_bar_horizontal.png", viewClass: ScrollBarsView, relevantFiles: ["views/scrollbars.xml"] });
        ViewManager.instance.registerView({ title: "Sliders", smallIcon: "icons/16/seek_bar_050.png", largeIcon: "icons/32/seek_bar_050.png", viewClass: SlidersView, relevantFiles: ["views/sliders.xml"] });
        ViewManager.instance.registerView({ title: "Images", smallIcon: "icons/16/images_flickr.png", largeIcon: "icons/32/images_flickr.png", viewClass: ImagesView, relevantFiles: ["views/images.xml"] });
        ViewManager.instance.registerView({ title: "Steppers", smallIcon: "icons/16/spin.png", largeIcon: "icons/32/spin.png", viewClass: SteppersView, relevantFiles: ["views/steppers.xml"] });
        ViewManager.instance.registerView({ title: "Switches", smallIcon: "icons/16/button_toggle.png", largeIcon: "icons/32/button_toggle.png", viewClass: SwitchesView, relevantFiles: ["views/switches.xml"] });
        ViewManager.instance.registerView({ title: "Tabs", smallIcon: "icons/16/tab_content.png", largeIcon: "icons/32/tab_content.png", viewClass: TabsView, relevantFiles: ["views/tabs.xml"] });
        ViewManager.instance.registerView({ title: "Accordions", smallIcon: "icons/16/accordion.png", largeIcon: "icons/32/accordion.png", viewClass: AccordionsView, relevantFiles: ["views/accordions.xml"] });
        ViewManager.instance.registerView({ title: "Splitters", smallIcon: "icons/16/layouts_6.png", largeIcon: "icons/32/layouts_6.png", viewClass: SplitterView, relevantFiles: ["views/splitters.xml"] });
        ViewManager.instance.registerView({ title: "Dialogs", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: DialogsView, relevantFiles: ["views/dialogs.xml", "src/views/DialogsView.hx", "views/mycustomdialog.xml"] });
        
        ViewManager.instance.registerView({ title: "Absolute Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: AbsoluteLayoutsView, relevantFiles: ["views/absolute-layouts.xml"] });
        ViewManager.instance.registerView({ title: "Box Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: BoxLayoutsView, relevantFiles: ["views/box-layouts.xml"] });
        ViewManager.instance.registerView({ title: "Horizontal Layouts", smallIcon: "icons/16/layouts_3.png", largeIcon: "icons/32/layouts_3.png", viewClass: HorizontalLayoutsView, relevantFiles: ["views/horizontal-layouts.xml"] });
        ViewManager.instance.registerView({ title: "Vertical Layouts", smallIcon: "icons/16/layouts_4.png", largeIcon: "icons/32/layouts_4.png", viewClass: VerticalLayoutsView, relevantFiles: ["views/vertical-layouts.xml"] });
        ViewManager.instance.registerView({ title: "Grid Layouts", smallIcon: "icons/16/layouts_6.png", largeIcon: "icons/32/layouts_6.png", viewClass: GridLayoutsView, relevantFiles: ["views/grid-layouts.xml"] });
        
        populateViewList();
        populateMainList();
        
        /*
        scrollUpIcon.onClick = function(e) {
            mainList.vscrollPos -= 50;
        }
        scrollDownIcon.onClick = function(e) {
            mainList.vscrollPos += 50;
        }
        */
        
        scrollUpIcon.registerEvent(MouseEvent.MOUSE_DOWN, onScrollUpIconMouseDown);
        scrollDownIcon.registerEvent(MouseEvent.MOUSE_DOWN, onScrollDownIconMouseUp);
        
    }
    
    private var _timer:Timer = null;
    private var _sdirection:String = null;
    private function onScrollUpIconMouseDown(e) {
        _sdirection = "up";
        _timer = new Timer(5, onScrollTimer);
        Screen.instance.registerEvent(MouseEvent.MOUSE_UP, onScreenMouseUp);
    }
    
    private function onScrollDownIconMouseUp(e) {
        _sdirection = "down";
        _timer = new Timer(5, onScrollTimer);
        Screen.instance.registerEvent(MouseEvent.MOUSE_UP, onScreenMouseUp);
    }

    private function onScreenMouseUp(e) {
        Screen.instance.unregisterEvent(MouseEvent.MOUSE_UP, onScreenMouseUp);
        _timer.stop();
        _timer = null;
    }
    
    private function onScrollTimer() {
        if (_direction == "up") {
            mainList.vscrollPos -= 3;
        } else if (_direction == "down") {
            mainList.vscrollPos += 3;
        }
    }
    
    private var _currentItem:SideItem = null;
    private function populateMainList() {
        var itemToSelect = null;
        for (v in ViewManager.instance.views) {
            var item = new SideItem();
            item.registerEvent(MouseEvent.CLICK, onItemClick);
            
            item.data = {
                label: v.title,
                image: v.largeIcon,
                info: v
            }
            mainList.addComponent(item);
            
            if (itemToSelect == null) {
                itemToSelect = item;
            }
        }
        
        itemToSelect.addClass("selected", true, true);
        _currentItem = itemToSelect;
    }
    
    private function onItemClick(e:MouseEvent) {
        var item = cast(e.target, SideItem);
        if (item == _currentItem) {
            return;
        }
        
        if (_currentItem != null) {
            _currentItem.removeClass("selected", true, true);
        }
        
        _currentItem = item;
        _currentItem.addClass("selected", true, true);
        
        ViewManager.instance.showView(_currentItem.data.info);
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