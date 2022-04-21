package views;

import haxe.ui.Toolkit;
import haxe.ui.containers.Box;
import haxe.ui.containers.HBox;
import haxe.ui.containers.TreeViewNode;
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
import views.ViewManager;
import views.ViewManager.ViewInfo;

using StringTools;

@:build(haxe.ui.macros.ComponentMacros.build("assets/main.xml"))
class MainView extends HBox {
    public function new() {
        super();
        trace("Screen size: " + Screen.instance.width + "x" + Screen.instance.height);
        Logger.logData = logData;
        ViewManager.instance.viewTabs = mainTabs;
        
        ViewManager.instance.registerView({ group: "Basic", title: "Buttons", smallIcon: "icons/16/buttons.png", largeIcon: "icons/32/buttons.png", viewClass: ButtonsView, relevantFiles: ["views/buttons.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "As Menus", smallIcon: "icons/16/layouts_3.png", largeIcon: "icons/32/layouts_3.png", viewClass: ButtonsAsMenusView, relevantFiles: ["views/buttons-as-menus.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "Styled Buttons", smallIcon: "icons/16/button.png", largeIcon: "icons/32/button.png", viewClass: ButtonsStyledView, relevantFiles: ["views/buttons-styled.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "Bitmap Buttons", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: ButtonsBitmapView, relevantFiles: ["views/buttons-bitmap.xml", "images/bitmap_button.png"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Check Boxes", smallIcon: "icons/16/check_boxes.png", largeIcon: "icons/32/check_boxes.png", viewClass: CheckBoxesView, relevantFiles: ["views/checkboxes.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Option Boxes", smallIcon: "icons/16/radio_button.png", largeIcon: "icons/32/radio_button.png", viewClass: OptionBoxesView, relevantFiles: ["views/optionboxes.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Labels", smallIcon: "icons/16/labels(2).png", largeIcon: "icons/32/labels(2).png", viewClass: LabelsView, relevantFiles: ["views/labels.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Links", smallIcon: "icons/16/labels.png", largeIcon: "icons/32/labels.png", viewClass: LinksView, relevantFiles: ["views/links.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Dropdowns", smallIcon: "icons/16/menu_item.png", largeIcon: "icons/32/menu_item.png", viewClass: DropDownsView, relevantFiles: ["views/dropdowns.xml", "src/views/DropDownsView.hx", "views/mydropdownhandler.xml", "src/views/MyDropDownHandlerView.hx"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Text Inputs", smallIcon: "icons/16/text_area(2).png", largeIcon: "icons/32/text_area(2).png", viewClass: TextInputsView, relevantFiles: ["views/textinputs.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Progress Bars", smallIcon: "icons/16/progressbar.png", largeIcon: "icons/32/progressbar.png", viewClass: ProgressBarsView, relevantFiles: ["views/progressbars.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Calendars", smallIcon: "icons/16/data_field.png", largeIcon: "icons/32/data_field.png", viewClass: CalendarsView, relevantFiles: ["views/calendars.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Scroll Bars", smallIcon: "icons/16/scroll_bar_horizontal.png", largeIcon: "icons/32/scroll_bar_horizontal.png", viewClass: ScrollBarsView, relevantFiles: ["views/scrollbars.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Sliders", smallIcon: "icons/16/seek_bar_050.png", largeIcon: "icons/32/seek_bar_050.png", viewClass: SlidersView, relevantFiles: ["views/sliders.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Images", smallIcon: "icons/16/images_flickr.png", largeIcon: "icons/32/images_flickr.png", viewClass: ImagesView, relevantFiles: ["views/images.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Steppers", smallIcon: "icons/16/spin.png", largeIcon: "icons/32/spin.png", viewClass: SteppersView, relevantFiles: ["views/steppers.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Switches", smallIcon: "icons/16/button_toggle.png", largeIcon: "icons/32/button_toggle.png", viewClass: SwitchesView, relevantFiles: ["views/switches.xml"] });
        
        ViewManager.instance.registerView({ group: "Containers", title: "Tabs", smallIcon: "icons/16/tab_content.png", largeIcon: "icons/32/tab_content.png", viewClass: TabsView, relevantFiles: ["views/tabs.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Menus", smallIcon: "icons/16/menu.png", largeIcon: "icons/32/menu.png", viewClass: MenusView, relevantFiles: ["views/menus.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Frames", smallIcon: "icons/16/attributes_display.png", largeIcon: "icons/32/attributes_display.png", viewClass: FramesView, relevantFiles: ["views/frames.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Scroll Views", smallIcon: "icons/16/scroll_pane_text_image.png", largeIcon: "icons/32/scroll_pane_text_image.png", viewClass: ScrollViewsView, relevantFiles: ["views/scrollviews.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "List Views", smallIcon: "icons/16/list_box.png", largeIcon: "icons/32/list_box.png", viewClass: ListViewsView, relevantFiles: ["views/listviews.xml", "src/views/ListViewsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"List Views", title: "As Menus", smallIcon: "icons/16/layouts_4.png", largeIcon: "icons/32/layouts_4.png", viewClass: ListViewsAsMenusView, relevantFiles: ["views/listviews-as-menus.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Table Views", smallIcon: "icons/16/table.png", largeIcon: "icons/32/table.png", viewClass: TableViewsView, relevantFiles: ["views/tableviews.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Tree Views", smallIcon: "icons/16/labels.png", largeIcon: "icons/32/labels.png", viewClass: TreeViewsView, relevantFiles: ["views/treeviews.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Side Bars", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: SidebarsView, relevantFiles: ["views/sidebars.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Property Grids", smallIcon: "icons/16/attributes_display.png", largeIcon: "icons/32/attributes_display.png", viewClass: PropertyGridsView, relevantFiles: ["views/propertygrids.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Accordions", smallIcon: "icons/16/accordion.png", largeIcon: "icons/32/accordion.png", viewClass: AccordionsView, relevantFiles: ["views/accordions.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Dialogs", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: DialogsView, relevantFiles: ["views/dialogs.xml", "src/views/DialogsView.hx", "views/mycustomdialog.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Cards", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: CardsView, relevantFiles: ["views/cards.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Splitters", smallIcon: "icons/16/layouts_6.png", largeIcon: "icons/32/layouts_6.png", viewClass: SplitterView, relevantFiles: ["views/splitters.xml"] });
        
        ViewManager.instance.registerView({ group: "Layouts", title: "Absolute Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: AbsoluteLayoutsView, relevantFiles: ["views/absolute-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Box Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: BoxLayoutsView, relevantFiles: ["views/box-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Horizontal Layouts", smallIcon: "icons/16/layouts_3.png", largeIcon: "icons/32/layouts_3.png", viewClass: HorizontalLayoutsView, relevantFiles: ["views/horizontal-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Vertical Layouts", smallIcon: "icons/16/layouts_4.png", largeIcon: "icons/32/layouts_4.png", viewClass: VerticalLayoutsView, relevantFiles: ["views/vertical-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Grid Layouts", smallIcon: "icons/16/layouts_6.png", largeIcon: "icons/32/layouts_6.png", viewClass: GridLayoutsView, relevantFiles: ["views/grid-layouts.xml"] });

        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Tooltips", smallIcon: "icons/16/label.png", largeIcon: "icons/32/label.png", viewClass: TooltipsView, relevantFiles: ["views/tooltips.xml"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Drag", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: DragManagerView, relevantFiles: ["views/drag-manager.xml"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Animation", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: AnimationView, relevantFiles: ["views/animation.xml"] });
        
    }
    
    public override function onReady() {
        super.onReady();
        populateMainTree();
    }
    
    private override function onThemeChanged() {
        super.onThemeChanged();
        #if js
        if (Toolkit.theme.startsWith("dark")) {
            js.Browser.document.body.style.backgroundColor = "#2c2f30";
        } else if (Toolkit.theme.startsWith("default")) {
            js.Browser.document.body.style.backgroundColor = "#ffffff";
        }
        #end
    }
    
    private function populateMainTree() {
        var node:TreeViewNode = null;
        for (groupName in ViewManager.instance.viewGroups.keys()) {
            var groupNode = mainTree.addNode({ text: groupName });
            groupNode.expanded = true;
            
            var list = ViewManager.instance.viewGroups.get(groupName);
            for (item in list) {
                var itemNode = groupNode.addNode({ text: item.title, icon: item.smallIcon, viewInfo: item });
                if (node == null) {
                    node = itemNode;
                }
                var subItems = ViewManager.instance.getItemsFromSubGroup(item.title);
                if (subItems.length > 0) {
                    for (subItem in subItems ) {
                        itemNode.addNode({ text: subItem.title, icon: subItem.smallIcon, viewInfo: subItem });
                    }
                }
            }
        }
        
        Toolkit.callLater(function() {
            mainTree.selectedNode = node;
        });
    }
    
    @:bind(mainTree, UIEvent.CHANGE)
    private function onMainTreeSelectionChanged(e) {
        if (mainTree.selectedNode == null) {
            return;
        }
        
        var viewInfo = mainTree.selectedNode.data.viewInfo;
        if (viewInfo == null) {
            return;
        }
        ViewManager.instance.showView(viewInfo);
    }
}