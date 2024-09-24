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
        
        ViewManager.instance.registerView({ group: "Basic", title: "Buttons", smallIcon: "icons/svg/buttons.svg", largeIcon: "icons/svg/buttons.svg", viewClass: ButtonsView, relevantFiles: ["views/buttons.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "As Menus", smallIcon: "icons/svg/layout-3-cols.svg", largeIcon: "icons/svg/layout-3-cols.svg", viewClass: ButtonsAsMenusView, relevantFiles: ["views/buttons-as-menus.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "Styled Buttons", smallIcon: "icons/svg/paintbrush.svg", largeIcon: "icons/svg/paintbrush.svg", viewClass: ButtonsStyledView, relevantFiles: ["views/buttons-styled.xml"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Buttons", title: "Bitmap Buttons", smallIcon: "icons/svg/paintbrush.svg", largeIcon: "icons/svg/paintbrush.svg", viewClass: ButtonsBitmapView, relevantFiles: ["views/buttons-bitmap.xml", "images/bitmap_button.png"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Check Boxes", smallIcon: "icons/svg/checkboxes.svg", largeIcon: "icons/svg/checkboxes.svg", viewClass: CheckBoxesView, relevantFiles: ["views/checkboxes.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Option Boxes", smallIcon: "icons/svg/optionboxes.svg", largeIcon: "icons/svg/optionboxes.svg", viewClass: OptionBoxesView, relevantFiles: ["views/optionboxes.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Labels", smallIcon: "icons/svg/labels.svg", largeIcon: "icons/svg/labels.svg", viewClass: LabelsView, relevantFiles: ["views/labels.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Links", smallIcon: "icons/svg/links.svg", largeIcon: "icons/svg/links.svg", viewClass: LinksView, relevantFiles: ["views/links.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Dropdowns", smallIcon: "icons/svg/dropdown.svg", largeIcon: "icons/svg/dropdown.svg", viewClass: DropDownsView, relevantFiles: ["views/dropdowns.xml", "src/views/DropDownsView.hx", "views/mydropdownhandler.xml", "src/views/MyDropDownHandlerView.hx"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Text Inputs", smallIcon: "icons/svg/textinputs.svg", largeIcon: "icons/svg/textinputs.svg", viewClass: TextInputsView, relevantFiles: ["views/textinputs.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Progress Bars", smallIcon: "icons/svg/progressbars.svg", largeIcon: "icons/svg/progressbars.svg", viewClass: ProgressBarsView, relevantFiles: ["views/progressbars.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Calendars", smallIcon: "icons/svg/calendars.svg", largeIcon: "icons/svg/calendars.svg", viewClass: CalendarsView, relevantFiles: ["views/calendars.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Scroll Bars", smallIcon: "icons/svg/scrollbars.svg", largeIcon: "icons/svg/scrollbars.svg", viewClass: ScrollBarsView, relevantFiles: ["views/scrollbars.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Sliders", smallIcon: "icons/svg/sliders.svg", largeIcon: "icons/svg/sliders.svg", viewClass: SlidersView, relevantFiles: ["views/sliders.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Images", smallIcon: "icons/svg/images.svg", largeIcon: "icons/svg/images.svg", viewClass: ImagesView, relevantFiles: ["views/images.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Steppers", smallIcon: "icons/svg/steppers.svg", largeIcon: "icons/svg/steppers.svg", viewClass: SteppersView, relevantFiles: ["views/steppers.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Switches", smallIcon: "icons/svg/switches.svg", largeIcon: "icons/svg/switches.svg", viewClass: SwitchesView, relevantFiles: ["views/switches.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Canvas", smallIcon: "icons/svg/canvas.svg", largeIcon: "icons/svg/canvas.svg", viewClass: CanvasView, relevantFiles: ["views/canvas.xml", "src/custom/DemoGraph.hx", "src/custom/ColorTable.hx", "src/custom/Noise.hx", "src/custom/MiniGraph.hx"] });
            ViewManager.instance.registerView({ group: "Basic", subGroup: "Canvas", title: "As Icons", smallIcon: "icons/svg/canvas-as-icons.svg", largeIcon: "icons/svg/canvas-as-icons.svg", viewClass: CanvasAsIconsView, relevantFiles: ["views/canvas-as-icons.xml", "src/views/CanvasAsIconsView.hx", "src/custom/Noise.hx", "src/custom/MiniGraph.hx"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Animations", smallIcon: "icons/svg/animation.svg", largeIcon: "icons/svg/animation.svg", viewClass: AnimationsView, relevantFiles: ["views/animations.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Spinners", smallIcon: "icons/svg/animation.svg", largeIcon: "icons/svg/animation.svg", viewClass: SpinnersView, relevantFiles: ["views/spinners.xml"] });
        //ViewManager.instance.registerView({ group: "Basic", title: "Atlas Player", smallIcon: "icons/svg/animation.svg", largeIcon: "icons/svg/animation.svg", viewClass: AtlasPlayerView, relevantFiles: ["views/atlas-player.xml", "src/views/AtlasPlayerView.hx"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Color Pickers", smallIcon: "icons/svg/color-pickers.svg", largeIcon: "icons/svg/color-pickers.svg", viewClass: ColorPickersView, relevantFiles: ["views/color-pickers.xml"] });
        ViewManager.instance.registerView({ group: "Basic", title: "Item Pickers", smallIcon: "icons/svg/item-pickers.svg", largeIcon: "icons/svg/item-pickers.svg", viewClass: ItemPickersView, relevantFiles: ["views/item-pickers.xml"] });
        
        ViewManager.instance.registerView({ group: "Containers", title: "Tabs", smallIcon: "icons/svg/tabs.svg", largeIcon: "icons/svg/tabs.svg", viewClass: TabsView, relevantFiles: ["views/tabs.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Tabs", title: "Tab Styling", smallIcon: "icons/svg/paintbrush.svg", largeIcon: "icons/svg/paintbrush.svg", viewClass: TabsStylingView, relevantFiles: ["views/tabs-styling.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Menus", smallIcon: "icons/svg/menus.svg", largeIcon: "icons/svg/menus.svg", viewClass: MenusView, relevantFiles: ["views/menus.xml", "src/views/MenusView.hx"] });
            //ViewManager.instance.registerView({ group: "Containers", subGroup:"Menus", title: "Complex Menu", smallIcon: "icons/svg/menus.svg", largeIcon: "icons/svg/menus.svg", viewClass: ComplexContextMenuView, relevantFiles: ["views/complex-context-menu.xml", "src/views/ComplexContextMenuView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Frames", smallIcon: "icons/svg/frames.svg", largeIcon: "icons/svg/frames.svg", viewClass: FramesView, relevantFiles: ["views/frames.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Forms", smallIcon: "icons/svg/forms.svg", largeIcon: "icons/svg/forms.svg", viewClass: FormsView, relevantFiles: ["views/forms.xml", "src/views/FormsView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Scroll Views", smallIcon: "icons/svg/scrollviews.svg", largeIcon: "icons/svg/scrollviews.svg", viewClass: ScrollViewsView, relevantFiles: ["views/scrollviews.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Scroll Views", title: "Scroll Modes", smallIcon: "icons/svg/scrollviews.svg", largeIcon: "icons/svg/scrollviews.svg", viewClass: ScrollViewScrollModesView, relevantFiles: ["views/scrollview-scrollmodes.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Scroll Views", title: "Empty Scroll Views", smallIcon: "icons/svg/scrollviews.svg", largeIcon: "icons/svg/scrollviews.svg", viewClass: ScrollViewsEmptyContentsView, relevantFiles: ["src/views/ScrollViewsEmptyContentsView.hx", "views/scrollviews-empty-contents.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "List Views", smallIcon: "icons/svg/listviews.svg", largeIcon: "icons/svg/listviews.svg", viewClass: ListViewsView, relevantFiles: ["views/listviews.xml", "src/views/ListViewsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"List Views", title: "Component Events", smallIcon: "icons/svg/lightning.svg", largeIcon: "icons/svg/lightning.svg", viewClass: ListViewComponentEventsView, relevantFiles: ["views/listview-component-events.xml", "src/views/ListViewComponentEventsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"List Views", title: "As Menus", smallIcon: "icons/svg/listviews-as-menus.svg", largeIcon: "icons/svg/listviews-as-menus.svg", viewClass: ListViewsAsMenusView, relevantFiles: ["views/listviews-as-menus.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"List Views", title: "Code Item Renderer", smallIcon: "icons/svg/listviews.svg", largeIcon: "icons/svg/listviews.svg", viewClass: ListViewCodeItemRenderer, relevantFiles: ["views/listview-code-item-renderer.xml", "src/custom/MyListViewItemRenderer.hx", "src/views/ListViewCodeItemRenderer.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Table Views", smallIcon: "icons/svg/tables.svg", largeIcon: "icons/svg/tables.svg", viewClass: TableViewsView, relevantFiles: ["views/tableviews.xml", "src/views/TableViewsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Table Views", title: "Column Styling", smallIcon: "icons/svg/paintbrush.svg", largeIcon: "icons/svg/paintbrush.svg", viewClass: TableViewColumnStylingView, relevantFiles: ["views/tableview-column-styling.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Table Views", title: "Editable Tables", smallIcon: "icons/svg/textinputs.svg", largeIcon: "icons/svg/textinputs.svg", viewClass: EditableTableView, relevantFiles: ["views/editable-table-view.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Table Views", title: "Dynamic Tables", smallIcon: "icons/svg/tables.svg", largeIcon: "icons/svg/tables.svg", viewClass: DynamicTablesView, relevantFiles: ["views/dynamic-tables.xml", "src/views/DynamicTablesView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Tree Views", smallIcon: "icons/svg/treeviews.svg", largeIcon: "icons/svg/treeviews.svg", viewClass: TreeViewsView, relevantFiles: ["views/treeviews.xml", "src/views/TreeViewsView.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup: "Tree Views", title: "Lazy Loading", smallIcon: "icons/svg/treeviews.svg", largeIcon: "icons/svg/treeviews.svg", viewClass: TreeViewLazyLoadingView, relevantFiles: ["views/treeview-lazy-loading.xml", "src/views/TreeViewLazyLoadingView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Side Bars", smallIcon: "icons/svg/sidebar.svg", largeIcon: "icons/svg/sidebar.svg", viewClass: SidebarsView, relevantFiles: ["views/sidebars.xml", "src/views/SidebarsView.hx", "views/mysidebar.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Property Grids", smallIcon: "icons/svg/listviews.svg", largeIcon: "icons/svg/listviews.svg", viewClass: PropertyGridsView, relevantFiles: ["views/propertygrids.xml", "src/views/PropertyGridsView.hx", "src/custom/PropertyGroupVector.hx", "src/custom/PropertyGroupArray.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Accordions", smallIcon: "icons/svg/accordions.svg", largeIcon: "icons/svg/accordions.svg", viewClass: AccordionsView, relevantFiles: ["views/accordions.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Dialogs", smallIcon: "icons/svg/dialogs.svg", largeIcon: "icons/svg/dialogs.svg", viewClass: DialogsView, relevantFiles: ["views/dialogs.xml", "src/views/DialogsView.hx", "views/mycustomdialog.xml", "views/simple-login-dialog.xml"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Dialogs", title: "File Dialogs", smallIcon: "icons/svg/dialogs.svg", largeIcon: "icons/svg/dialogs.svg", viewClass: FileDialogsView, relevantFiles: ["views/file-dialogs.xml", "src/views/FileDialogsView.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Cards", smallIcon: "icons/svg/cards.svg", largeIcon: "icons/svg/cards.svg", viewClass: CardsView, relevantFiles: ["views/cards.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Splitters", smallIcon: "icons/svg/splitters.svg", largeIcon: "icons/svg/splitters.svg", viewClass: SplitterView, relevantFiles: ["views/splitters.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Windows", smallIcon: "icons/svg/windows.svg", largeIcon: "icons/svg/windows.svg", viewClass: WindowsView, relevantFiles: ["views/windows.xml", "src/views/WindowsView.hx", "src/windows/SimpleFormWindow.hx", "src/windows/SimpleGraphWindow.hx", "src/windows/InlineDialogsWindow.hx"] });
            ViewManager.instance.registerView({ group: "Containers", subGroup:"Windows", title: "Multiple Managers", smallIcon: "icons/svg/windows-multiple.svg", largeIcon: "icons/svg/windows-multiple.svg", viewClass: WindowsMultipleManagersView, relevantFiles: ["views/windows-multiple-managers.xml", "src/views/WindowsMultipleManagersView.hx", "src/windows/SimpleFormWindow.hx", "src/windows/SimpleGraphWindow.hx", "src/windows/InlineDialogsWindow.hx"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Panels", smallIcon: "icons/svg/panels.svg", largeIcon: "icons/svg/panels.svg", viewClass: PanelsView, relevantFiles: ["views/panels.xml"] });
        ViewManager.instance.registerView({ group: "Containers", title: "Collapsible", smallIcon: "icons/svg/accordions.svg", largeIcon: "icons/svg/accordions.svg", viewClass: CollapsibleView, relevantFiles: ["views/collapsible.xml"] });

        ViewManager.instance.registerView({ group: "Layouts", title: "Absolute Layouts", smallIcon: "icons/svg/layout-absolute.svg", largeIcon: "icons/svg/layout-absolute.svg", viewClass: AbsoluteLayoutsView, relevantFiles: ["views/absolute-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Stack Layouts", smallIcon: "icons/svg/layout-box.svg", largeIcon: "icons/svg/layout-box.svg", viewClass: StackLayoutsView, relevantFiles: ["views/stack-layouts.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Box Layouts", smallIcon: "icons/svg/layout-box.svg", largeIcon: "icons/svg/layout-box.svg", viewClass: BoxLayoutsView, relevantFiles: ["views/box-layouts.xml"] });
            //ViewManager.instance.registerView({ group: "Layouts", subGroup: "Box Layouts", title: "Advanced Options", smallIcon: "icons/svg/layout-box.svg", largeIcon: "icons/svg/layout-box.svg", viewClass: BoxLayoutsAdvancedOptionsView, relevantFiles: ["views/box-layouts-advanced-options.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Horizontal Layouts", smallIcon: "icons/svg/layout-horizontal.svg", largeIcon: "icons/svg/layout-horizontal.svg", viewClass: HorizontalLayoutsView, relevantFiles: ["views/horizontal-layouts.xml"] });
            //ViewManager.instance.registerView({ group: "Layouts", subGroup: "Horizontal Layouts", title: "Advanced Options", smallIcon: "icons/svg/layout-horizontal.svg", largeIcon: "icons/svg/layout-horizontal.svg", viewClass: HorizontalLayoutsAdvancedOptionsView, relevantFiles: ["views/horizontal-layouts-advanced-options.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Vertical Layouts", smallIcon: "icons/svg/layout-vertical.svg", largeIcon: "icons/svg/layout-vertical.svg", viewClass: VerticalLayoutsView, relevantFiles: ["views/vertical-layouts.xml"] });
            //ViewManager.instance.registerView({ group: "Layouts", subGroup: "Vertical Layouts", title: "Advanced Options", smallIcon: "icons/svg/layout-vertical.svg", largeIcon: "icons/svg/layout-vertical.svg", viewClass: VerticalLayoutsAdvancedOptionsView, relevantFiles: ["views/vertical-layouts-advanced-options.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "Grid Layouts", smallIcon: "icons/svg/layout-grid.svg", largeIcon: "icons/svg/layout-grid-svg", viewClass: GridLayoutsView, relevantFiles: ["views/grid-layouts.xml"] });
            //ViewManager.instance.registerView({ group: "Layouts", subGroup: "Grid Layouts", title: "Advanced Options", smallIcon: "icons/svg/layout-grid.svg", largeIcon: "icons/svg/layout-grid-svg", viewClass: GridLayoutsAdvancedOptionsView, relevantFiles: ["views/grid-layouts-advanced-options.xml"] });
        ViewManager.instance.registerView({ group: "Layouts", title: "CSS Layout Properties", smallIcon: "icons/svg/layout-absolute.svg", largeIcon: "icons/svg/layout-absolute.svg", viewClass: CssLayoutPropertiesView, relevantFiles: ["views/css-layout-properties.xml"] });

        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Box Datasources", smallIcon: "icons/svg/layout-box.svg", largeIcon: "icons/svg/layout-box.svg", viewClass: BoxDataSourcesView, relevantFiles: ["views/box-data-sources.xml", "src/views/BoxDataSourcesView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Tooltips", smallIcon: "icons/svg/tooltips.svg", largeIcon: "icons/svg/tooltips.svg", viewClass: TooltipsView, relevantFiles: ["views/tooltips.xml", "src/views/TooltipsView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Locales", smallIcon: "icons/svg/locales.svg", largeIcon: "icons/svg/locales.svg", viewClass: LocalesView, relevantFiles: ["views/locales.xml", "src/views/LocalesView.hx", "locales/en.properties", "locales/en_US.properties", "locales/fr.properties", "locales/cy.properties", "locales/pl.properties", "locales/ru.properties"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Drag", smallIcon: "icons/svg/drag.svg", largeIcon: "icons/svg/drag.svg", viewClass: DragManagerView, relevantFiles: ["views/drag-manager.xml", "src/views/DragManagerView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Animation", smallIcon: "icons/svg/animation.svg", largeIcon: "icons/svg/animation.svg", viewClass: AnimationView, relevantFiles: ["views/animation.xml", "src/views/AnimationView.hx"] });
            ViewManager.instance.registerView({ group: "Miscellaneous", subGroup:"Animation", title: "Animated Highlight", smallIcon: "icons/svg/animation.svg", largeIcon: "icons/svg/animation.svg", viewClass: AnimatedHighlightView, relevantFiles: ["views/animated-highlight.xml"] });
            ViewManager.instance.registerView({ group: "Miscellaneous", subGroup:"Animation", title: "Animated Dots", smallIcon: "icons/svg/animation.svg", largeIcon: "icons/svg/animation.svg", viewClass: AnimatedDotsView, relevantFiles: ["views/animated-dots.xml", "src/views/AnimatedDotsView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Validators", smallIcon: "icons/svg/validators.svg", largeIcon: "icons/svg/validators.svg", viewClass: ValidatorsView, relevantFiles: ["views/validators.xml", "src/views/ValidatorsView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Custom Component", smallIcon: "icons/svg/scrollviews.svg", largeIcon: "icons/svg/scrollviews.svg", viewClass: CustomComponentView, relevantFiles: ["views/custom-component.xml", "src/views/CustomComponentView.hx", "src/custom/IFrame.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "App Icon", smallIcon: "icons/svg/app-icon.svg", largeIcon: "icons/svg/app-icon.svg", viewClass: AppIconView, relevantFiles: ["views/app-icon.xml", "src/views/AppIconView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Notifications", smallIcon: "icons/svg/notifications.svg", largeIcon: "icons/svg/notifications.svg", viewClass: NotificationsView, relevantFiles: ["views/notifications.xml", "src/views/NotificationsView.hx"] });
            ViewManager.instance.registerView({ group: "Miscellaneous", subGroup: "Notifications", title: "Actions", smallIcon: "icons/svg/notifications.svg", largeIcon: "icons/svg/notifications.svg", viewClass: NotificationActionEventsView, relevantFiles: ["views/notification-action-events.xml", "src/views/NotificationActionEventsView.hx"] });
        //ViewManager.instance.registerView({ group: "Miscellaneous", title: "Namespaces", smallIcon: "icons/svg/16/document-code.png", largeIcon: "icons/svg/32/document-code.png", viewClass: NamespacesView, relevantFiles: ["views/namespaces.xml", "src/views/NamespacesView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Rules & Spacers", smallIcon: "icons/svg/rules.svg", largeIcon: "icons/svg/rules.svg", viewClass: RulesAndSpacersView, relevantFiles: ["views/rules-and-spacers.xml"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Filters", smallIcon: "icons/svg/filters.svg", largeIcon: "icons/svg/filters.svg", viewClass: FiltersView, relevantFiles: ["views/filters.xml", "src/views/FiltersView.hx"] });
            ViewManager.instance.registerView({ group: "Miscellaneous", subGroup: "Filters", title: "Neon Buttons", smallIcon: "icons/svg/paintbrush.svg", largeIcon: "icons/svg/paintbrush.svg", viewClass: NeonButtonsView, relevantFiles: ["views/neon-buttons.xml", "src/views/NeonButtonsView.hx"] });
        ViewManager.instance.registerView({ group: "Miscellaneous", title: "Shapes", smallIcon: "icons/svg/shapes.svg", largeIcon: "icons/svg/shapes.svg", viewClass: ShapesView, relevantFiles: ["views/shapes.xml"] });

        ViewManager.instance.registerView({ group: "Examples", title: "Simple Paint", smallIcon: "icons/svg/canvas.svg", largeIcon: "icons/svg/canvas.svg", viewClass: SimplePaintView, relevantFiles: ["views/simple-paint.xml", "src/views/SimplePaintView.hx"] });
        ViewManager.instance.registerView({ group: "Examples", title: "Todos", smallIcon: "icons/svg/todos.svg", largeIcon: "icons/svg/todos.svg", viewClass: TodosView, relevantFiles: ["views/todos.xml", "src/views/TodosView.hx", "css/todos.css", "images/unchecked.png", "images/checked.png", "images/delete.png"] });
        ViewManager.instance.registerView({ group: "Examples", title: "Employee App", smallIcon: "icons/svg/employee-app.svg", largeIcon: "icons/svg/employee-app.svg", viewClass: views.fakeemployeeapp.MainView, relevantFiles: ["src/views/fakeemployeeapp/MainView.hx", "src/views/fakeemployeeapp/main-view.xml", "src/views/fakeemployeeapp/FakePersonDetailsWindow.hx", "src/views/fakeemployeeapp/FakeDepartmentDetailsWindow.hx", "src/views/fakeemployeeapp/FakeEmailWindow.hx", "src/views/fakeemployeeapp/FakePersonManager.hx", "src/fakedata/FakePerson.hx", "src/fakedata/FakePeopleDB.hx"] });
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
        /*
        var indexToSelect = 0;
        var ds = themeSelector.dataSource;
        for (i in 0...ds.size) {
            if (ds.get(i).themeId == value) {
                indexToSelect = i;
                break;
            }
        }
        themeSelector.selectedIndex = indexToSelect;
        */
        themeSwitch.selected = (_theme == "dark");
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

    @:bind(themeSwitch, UIEvent.CHANGE)
    private function onThemeSwitchChanged(_) {
        var theme = themeSwitch.selected ? "dark" : "default";
        if (theme == _theme) {
            return;
        }
        _theme = theme;
        saveThemeSetting();
        #if js
        if (_theme != Toolkit.theme) {
            Toolkit.theme = _theme;
            changePage();
            //js.Browser.location.reload();
        }
        #end
    }    
    
    /*
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
    */
    
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
            var icon = "icons/svg/folder3.svg";
            icon = null;
            var groupNode = mainTree.addNode({ text: groupName, icon: icon });
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