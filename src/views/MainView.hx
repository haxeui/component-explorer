package views;

import haxe.ui.Toolkit;
import haxe.ui.containers.HBox;
import haxe.ui.containers.TreeViewNode;
import haxe.ui.core.Screen;
import haxe.ui.events.UIEvent;
import haxe.ui.themes.ThemeManager;
import js.Browser;
import util.Logger;
import views.AnimatedHighlightView;
import views.AnimationsView;
import views.CardsView;
import views.CustomComponentView;
import views.FramesView;
import views.LinksView;
import views.SimplePaintView;
import views.SplitterView;
import views.TreeViewsView;
import views.ViewManager;

using StringTools;

@:build(haxe.ui.macros.ComponentMacros.build("assets/main.xml"))
class MainView extends HBox {
    public function new() {
        super();
        loadThemeSetting();
        trace("Screen size: " + Screen.instance.width + "x" + Screen.instance.height);
        Logger.logData = logData;
        ViewManager.instance.viewTabs = mainTabs;
        
        ViewManager.instance.registerView({ group: "Basic", title: "Buttons", smallIcon: "icons/16/buttons.png", largeIcon: "icons/32/buttons.png", viewClass: ButtonsView, relevantFiles: ["views/buttons.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "As Menus", smallIcon: "icons/16/layouts_3.png", largeIcon: "icons/32/layouts_3.png", viewClass: ButtonsAsMenusView, relevantFiles: ["views/buttons-as-menus.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "Styled Buttons", smallIcon: "icons/16/button.png", largeIcon: "icons/32/button.png", viewClass: ButtonsStyledView, relevantFiles: ["views/buttons-styled.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "Bitmap Buttons", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: ButtonsBitmapView, relevantFiles: ["views/buttons-bitmap.xml", "images/bitmap_button.png"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Check Boxes", smallIcon: "icons/16/check_boxes.png", largeIcon: "icons/32/check_boxes.png", viewClass: CheckBoxesView, relevantFiles: ["views/checkboxes.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Option Boxes", smallIcon: "icons/16/radio_button.png", largeIcon: "icons/32/radio_button.png", viewClass: OptionBoxesView, relevantFiles: ["views/optionboxes.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Labels", smallIcon: "icons/16/labels2.png", largeIcon: "icons/32/labels2.png", viewClass: LabelsView, relevantFiles: ["views/labels.xml"] });
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
        ViewManager.instance.registerView({ group: "Basic", title: "Canvas", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: CanvasView, relevantFiles: ["views/canvas.xml", "src/custom/DemoGraph.hx", "src/custom/ColorTable.hx", "src/custom/Noise.hx", "src/custom/MiniGraph.hx"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Canvas", title: "As Icons", smallIcon: "icons/16/images_flickr.png", largeIcon: "icons/32/images_flickr.png", viewClass: CanvasAsIconsView, relevantFiles: ["views/canvas-as-icons.xml", "src/views/CanvasAsIconsView.hx", "src/custom/Noise.hx", "src/custom/MiniGraph.hx"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Animations", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: AnimationsView, relevantFiles: ["views/animations.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Color Pickers", smallIcon: "icons/16/color-picker-default.png", largeIcon: "icons/32/color-picker-default.png", viewClass: ColorPickersView, relevantFiles: ["views/color-pickers.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Item Pickers", smallIcon: "icons/16/menu.png", largeIcon: "icons/32/menu.png", viewClass: ItemPickersView, relevantFiles: ["views/item-pickers.xml"] });
        
        ViewManager.instance.registerView({ group: "Containers", title: "Tabs", smallIcon: "icons/16/tab_content.png", largeIcon: "icons/32/tab_content.png", viewClass: TabsView, relevantFiles: ["views/tabs.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Menus", smallIcon: "icons/16/menu.png", largeIcon: "icons/32/menu.png", viewClass: MenusView, relevantFiles: ["views/menus.xml", "src/views/MenusView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Frames", smallIcon: "icons/16/attributes_display.png", largeIcon: "icons/32/attributes_display.png", viewClass: FramesView, relevantFiles: ["views/frames.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Forms", smallIcon: "icons/16/labels.png", largeIcon: "icons/32/labels.png", viewClass: FormsView, relevantFiles: ["views/forms.xml", "src/views/FormsView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Scroll Views", smallIcon: "icons/16/scroll_pane_text_image.png", largeIcon: "icons/32/scroll_pane_text_image.png", viewClass: ScrollViewsView, relevantFiles: ["views/scrollviews.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "List Views", smallIcon: "icons/16/list_box.png", largeIcon: "icons/32/list_box.png", viewClass: ListViewsView, relevantFiles: ["views/listviews.xml", "src/views/ListViewsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"List Views", title: "Component Events", smallIcon: "icons/16/buttons.png", largeIcon: "icons/32/buttons.png", viewClass: ListViewComponentEventsView, relevantFiles: ["views/listview-component-events.xml", "src/views/ListViewComponentEventsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"List Views", title: "As Menus", smallIcon: "icons/16/layouts_4.png", largeIcon: "icons/32/layouts_4.png", viewClass: ListViewsAsMenusView, relevantFiles: ["views/listviews-as-menus.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Table Views", smallIcon: "icons/16/table.png", largeIcon: "icons/32/table.png", viewClass: TableViewsView, relevantFiles: ["views/tableviews.xml", "src/views/TableViewsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Table Views", title: "Column Styling", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: TableViewColumnStylingView, relevantFiles: ["views/tableview-column-styling.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Table Views", title: "Editable Tables", smallIcon: "icons/16/table.png", largeIcon: "icons/32/table.png", viewClass: EditableTableView, relevantFiles: ["views/editable-table-view.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Tree Views", smallIcon: "icons/16/labels.png", largeIcon: "icons/32/labels.png", viewClass: TreeViewsView, relevantFiles: ["views/treeviews.xml", "src/views/TreeViewsView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Side Bars", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: SidebarsView, relevantFiles: ["views/sidebars.xml", "src/views/SidebarsView.hx", "views/mysidebar.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Property Grids", smallIcon: "icons/16/attributes_display.png", largeIcon: "icons/32/attributes_display.png", viewClass: PropertyGridsView, relevantFiles: ["views/propertygrids.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Accordions", smallIcon: "icons/16/accordion.png", largeIcon: "icons/32/accordion.png", viewClass: AccordionsView, relevantFiles: ["views/accordions.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Dialogs", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: DialogsView, relevantFiles: ["views/dialogs.xml", "src/views/DialogsView.hx", "views/mycustomdialog.xml", "views/simple-login-dialog.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Dialogs", title: "File Dialogs", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: FileDialogsView, relevantFiles: ["views/file-dialogs.xml", "src/views/FileDialogsView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Cards", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: CardsView, relevantFiles: ["views/cards.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Splitters", smallIcon: "icons/16/layouts_6.png", largeIcon: "icons/32/layouts_6.png", viewClass: SplitterView, relevantFiles: ["views/splitters.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Windows", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: WindowsView, relevantFiles: ["views/windows.xml", "src/views/WindowsView.hx", "src/windows/SimpleFormWindow.hx", "src/windows/SimpleGraphWindow.hx", "src/windows/InlineDialogsWindow.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Windows", title: "Multiple Managers", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: WindowsMultipleManagersView, relevantFiles: ["views/windows-multiple-managers.xml", "src/views/WindowsMultipleManagersView.hx", "src/windows/SimpleFormWindow.hx", "src/windows/SimpleGraphWindow.hx", "src/windows/InlineDialogsWindow.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Panels", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: PanelsView, relevantFiles: ["views/panels.xml"] });

        ViewManager.instance.registerView({ group: "Layouts", title: "Absolute Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: AbsoluteLayoutsView, relevantFiles: ["views/absolute-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Box Layouts", smallIcon: "icons/16/layouts.png", largeIcon: "icons/32/layouts.png", viewClass: BoxLayoutsView, relevantFiles: ["views/box-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Horizontal Layouts", smallIcon: "icons/16/layouts_3.png", largeIcon: "icons/32/layouts_3.png", viewClass: HorizontalLayoutsView, relevantFiles: ["views/horizontal-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Vertical Layouts", smallIcon: "icons/16/layouts_4.png", largeIcon: "icons/32/layouts_4.png", viewClass: VerticalLayoutsView, relevantFiles: ["views/vertical-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Grid Layouts", smallIcon: "icons/16/layouts_6.png", largeIcon: "icons/32/layouts_6.png", viewClass: GridLayoutsView, relevantFiles: ["views/grid-layouts.xml"] });

        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Tooltips", smallIcon: "icons/16/label.png", largeIcon: "icons/32/label.png", viewClass: TooltipsView, relevantFiles: ["views/tooltips.xml", "src/views/TooltipsView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Locales", smallIcon: "icons/16/labels2.png", largeIcon: "icons/32/labels2.png", viewClass: LocalesView, relevantFiles: ["views/locales.xml", "src/views/LocalesView.hx", "locales/en.properties", "locales/en_US.properties", "locales/fr.properties", "locales/cy.properties", "locales/pl.properties", "locales/ru.properties"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Drag", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: DragManagerView, relevantFiles: ["views/drag-manager.xml", "src/views/DragManagerView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Animation", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: AnimationView, relevantFiles: ["views/animation.xml", "src/views/AnimationView.hx"] });
            ViewManager.instance.registerView({ group: "Miscellaneous", subGroup:"Animation", title: "Animated Highlight", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: AnimatedHighlightView, relevantFiles: ["views/animated-highlight.xml"] });
            ViewManager.instance.registerView({ group: "Miscellaneous", subGroup:"Animation", title: "Animated Dots", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: AnimatedDotsView, relevantFiles: ["views/animated-dots.xml", "src/views/AnimatedDotsView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Validators", smallIcon: "icons/16/textfield.png", largeIcon: "icons/32/textfield.png", viewClass: ValidatorsView, relevantFiles: ["views/validators.xml", "src/views/ValidatorsView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Custom Component", smallIcon: "icons/16/list.png", largeIcon: "icons/32/list.png", viewClass: CustomComponentView, relevantFiles: ["views/custom-component.xml", "src/views/CustomComponentView.hx", "src/custom/IFrame.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "App Icon", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: AppIconView, relevantFiles: ["views/app-icon.xml", "src/views/AppIconView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Notifications", smallIcon: "icons/16/button.png", largeIcon: "icons/32/button.png", viewClass: NotificationsView, relevantFiles: ["views/notifications.xml", "src/views/NotificationsView.hx"] });
        //ViewManager.instance.registerView({ group: "Miscellaneous", title: "Namespaces", smallIcon: "icons/16/document-code.png", largeIcon: "icons/32/document-code.png", viewClass: NamespacesView, relevantFiles: ["views/namespaces.xml", "src/views/NamespacesView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Rules & Spacers", smallIcon: "icons/16/layouts_4.png", largeIcon: "icons/32/layouts_4.png", viewClass: RulesAndSpacersView, relevantFiles: ["views/rules-and-spacers.xml"] });

        ViewManager.instance.registerView({ group: "Examples", title: "Simple Paint", smallIcon: "icons/16/images.png", largeIcon: "icons/32/images.png", viewClass: SimplePaintView, relevantFiles: ["views/simple-paint.xml", "src/views/SimplePaintView.hx"] });
        ViewManager.instance.registerView({ group: "Examples", title: "Todos", smallIcon: "icons/16/radiobutton_group.png", largeIcon: "icons/32/radiobutton_group.png", viewClass: TodosView, relevantFiles: ["views/todos.xml", "src/views/TodosView.hx", "css/todos.css", "images/unchecked.png", "images/checked.png", "images/delete.png"] });
        ViewManager.instance.registerView({ group: "Examples", title: "Employee App", smallIcon: "icons/16/dialog.png", largeIcon: "icons/32/dialog.png", viewClass: views.fakeemployeeapp.MainView, relevantFiles: ["src/views/fakeemployeeapp/MainView.hx", "src/views/fakeemployeeapp/main-view.xml", "src/views/fakeemployeeapp/FakePersonDetailsWindow.hx", "src/views/fakeemployeeapp/FakeDepartmentDetailsWindow.hx", "src/views/fakeemployeeapp/FakeEmailWindow.hx", "src/views/fakeemployeeapp/FakePersonManager.hx", "src/fakedata/FakePerson.hx", "src/fakedata/FakePeopleDB.hx"] });
    }
    
    public override function onReady() {
        super.onReady();
        populateMainTree();
    }
    
    private function changePage() {
        #if js
        
        var defaultColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("default-background-color");
        var secondaryColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("secondary-background-color");
        var borderColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("normal-border-color");
        var accentColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("normal-text-color");
        
        js.Browser.document.body.style.backgroundColor = defaultColor;
        js.Browser.document.getElementsByClassName("navigation-header-full").item(0).style.backgroundColor = secondaryColor;
        js.Browser.document.getElementsByClassName("navigation-header-full").item(0).style.borderColor = borderColor;
        js.Browser.document.getElementsByClassName("navigation-header-full").item(0).style.setProperty("box-shadow", "none");
        
        js.Browser.document.getElementsByClassName("selected").item(0).style.color = accentColor;
        #end
    }
    
    private function saveThemeSetting() {
        #if js
        var days = 365;
        js.Cookie.set("haxeui-theme", _theme, days * 24 * 60 * 60 * 1000);
        trace("saved theme cookie: " + _theme);
        #end
    }
    
    private function saveTreePath() {
        #if js
        var path = mainTree.selectedNode.nodePath();
        var days = 365;
        js.Cookie.set("haxeui-selected-path", path, days * 24 * 60 * 60 * 1000);
        trace("saved path: " + path);
        #end
    }
    
    private var _theme:String = "default";
    private function loadThemeSetting() {
        #if js
        var value = js.Cookie.get("haxeui-theme");
        if (value == null) {
            value = "default";
        }
        _theme = value;
        trace("loaded theme cookie: " + value);
        var indexToSelect = 0;
        var ds = themeSelector.dataSource;
        for (i in 0...ds.size) {
            if (ds.get(i).themeId == value) {
                indexToSelect = i;
                break;
            }
        }
        themeSelector.selectedIndex = indexToSelect;
        if (_theme != Toolkit.theme) {
            Toolkit.theme = _theme;
            changePage();
        }
        #end
    }
    
    private function loadTreePath():String {
        #if js
        return js.Cookie.get("haxeui-selected-path");
        #else
        return null;
        #end
    }
    
    @:bind(themeSelector, UIEvent.CHANGE)
    private function onThemeSelectorChanged(_) {
        if (_theme == themeSelector.selectedItem.themeId) {
            return;
        }
        _theme = themeSelector.selectedItem.themeId;
        saveThemeSetting();
        #if js
        if (_theme != Toolkit.theme) {
            //Toolkit.theme = _theme;
            js.Browser.location.reload();
        }
        #end
    }
    
    private function populateMainTree() {
        var firstNode:TreeViewNode = null;
        var pathToSelect1:String = loadTreePath();
        
        var pathToSelect2:String = null;
        if (Browser.window.location.hash != null) {
            pathToSelect2 = Browser.window.location.hash.substr(1).replace("_", " ");
        }
        
        var nodeToSelect1:TreeViewNode = null;
        var nodeToSelect2:TreeViewNode = null;
        for (groupName in ViewManager.instance.viewGroups.keys()) {
            var groupNode = mainTree.addNode({ text: groupName });
            groupNode.expanded = true;
            
            var list = ViewManager.instance.viewGroups.get(groupName);
            for (item in list) {
                var itemNode = groupNode.addNode({ text: item.title, icon: item.smallIcon, viewInfo: item });
                if (itemNode.nodePath() == pathToSelect1) {
                    nodeToSelect1 = itemNode;
                }
                if (itemNode.nodePath().toLowerCase() == pathToSelect2) {
                    nodeToSelect2 = itemNode;
                }
                if (firstNode == null) {
                    firstNode = itemNode;
                }
                var subItems = ViewManager.instance.getItemsFromSubGroup(item.title);
                if (subItems.length > 0) {
                    //itemNode.expanded = true;
                    for (subItem in subItems ) {
                        var subNode = itemNode.addNode({ text: subItem.title, icon: subItem.smallIcon, viewInfo: subItem });
                        if (subNode.nodePath() == pathToSelect1) {
                            nodeToSelect1 = subNode;
                        }
                        if (subNode.nodePath().toLowerCase() == pathToSelect2) {
                            nodeToSelect2 = subNode;
                        }
                    }
                }
            }
        }
        
        if (nodeToSelect1 == null) {
            nodeToSelect1 = firstNode;
        }
        if (nodeToSelect2 != null) {
            nodeToSelect1 = nodeToSelect2;
        }
        
        Toolkit.callLater(function() {
            mainTree.selectedNode = nodeToSelect1;
        });
    }
    
    @:bind(mainTree, UIEvent.CHANGE)
    private function onMainTreeSelectionChanged(e) {
        if (mainTree.selectedNode == null) {
            return;
        }
        
        var path = mainTree.selectedNode.nodePath();
        trace("tree selection changed: " + path);
        saveTreePath();
        
        var viewInfo = mainTree.selectedNode.data.viewInfo;
        if (viewInfo == null) {
            return;
        }
        ViewManager.instance.showView(viewInfo);
        var safePath = path.toLowerCase().replace(" ", "_");
        Browser.window.history.pushState("", "", "#" + safePath);
    }
}