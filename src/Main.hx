package;

import haxe.Resource;
import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import haxe.ui.components.Button;
import haxe.ui.components.Image;
import haxe.ui.components.Label;
import haxe.ui.components.OptionBox;
import haxe.ui.containers.Box;
import haxe.ui.containers.HBox;
import haxe.ui.containers.ListView;
import haxe.ui.containers.ScrollView;
import haxe.ui.containers.TabView;
import haxe.ui.containers.VBox;
import haxe.ui.core.Component;
import haxe.ui.core.ItemRenderer;
import haxe.ui.core.Screen;
import haxe.ui.core.UIEvent;
import haxe.ui.data.ArrayDataSource;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.util.Timer;
import views.Boxes;
import views.Buttons;
import views.CheckBoxes;
import views.HorizontalScrollbars;
import views.Labels;
import views.OptionBoxes;
import views.TextFields;
import views.layouts.Horizontal;

class Main {
    private static var _listviews:Array<ListView> = [];
    private static var _main:Component;
    
    private static var GROUPS:Array<String> = ["General", "Containers", "Scrolls", "Layouts"];
    
    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {
            #if kha
            _main = ComponentMacros.buildComponent("../assets/ui/main.xml");
            #else
            _main = ComponentMacros.buildComponent("assets/ui/main.xml");
            #end

            var itemList:ScrollView = _main.findComponent("itemList", ScrollView);
            
            var items:Map<String, Array<ItemInfo>> = items();
            var first:ItemInfo = null;
            for (groupName in GROUPS) {
                var groupItems = items.get(groupName);
                
                itemList.addComponent(createHeader(groupName));
                
                var listView:ListView = new ListView();
                
                var itemRenderer = new ItemRenderer();
                itemRenderer.percentWidth = 100;
                var hbox:HBox = new HBox();
                hbox.percentWidth = 100;
                
                var icon:Image = new Image();
                icon.id = "icon";
                icon.styleString = "vertical-align:center";
                hbox.addComponent(icon);
                
                var label:Label = new Label();
                label.id = "value";
                label.percentWidth = 100;
                label.styleString = "vertical-align:center";
                hbox.addComponent(label);
                
                itemRenderer.addComponent(hbox);
                listView.addComponent(itemRenderer);
                
                
                listView.styleNames = "group-items";
                var ds:ArrayDataSource<Dynamic> = new ArrayDataSource<Dynamic>();
                for (item in groupItems) {
                    if (first == null) {
                        first = item;
                    }
                    ds.add({value: item.name, icon: item.icon, item: item});
                }
                listView.dataSource = ds;
                listView.registerEvent(UIEvent.CHANGE, onItemListChange);
                itemList.addComponent(listView);
                _listviews.push(listView);
            }
            
            
            app.addComponent(_main);
            
            _listviews[0].selectedIndex = 0;
            app.start();
        });
    }
    
    private static function createHeader(text:String):Component {
        var header:Label = new Label();
        header.text = text;
        header.styleNames = "header";
        
        var container:Box = new Box();
        container.styleNames = "header-container";
        container.addComponent(header);
        
        return container;
    }
    
    private static function onItemListChange(e:UIEvent) {
        for (lv in _listviews) {
            if (lv != e.target) {
                lv.resetSelection();
            }
        }
        
        var item:ItemInfo = cast(e.target, ListView).selectedItem.data.item;
        showView(item);
    }
    
    private static function showView(item:ItemInfo) {
        var tabs:TabView = _main.findComponent("tabs");
        tabs.removeAllTabs();
        
        var box:VBox = new VBox();
        box.paddingTop = 5;
        box.paddingLeft = 5;
        box.percentWidth = 100;
        box.percentHeight = 100;
        box.text = item.name;
        if (item.icon != null) {
            box.icon = item.icon;
        }
        tabs.addComponent(box);
        
        if (item.view != null) {
            var view:Component = Type.createInstance(item.view, []);
            box.addComponent(view);
        } else {
            var label:Label = new Label();
            label.text = item.name + " coming soon!";
            box.addComponent(label);
            return;
        }
        
        var xml = createTextView("xml", item.viewName, "icons/blue-document-xml.png");
        if (xml != null) {
            tabs.addComponent(xml);
        }
        
        var hscript = createTextView("hscript", item.viewName, "icons/blue-document-haxe.png");
        if (hscript != null) {
            tabs.addComponent(hscript);
        }
        
        var css = createTextView("css", item.viewName, "icons/blue-document-css.png");
        if (css != null) {
            tabs.addComponent(css);
        }
        
        for (f in item.additionalFiles) {
            var parts = f.split(".");
            var filename = parts[0];
            var type = parts[1];
            var icon = "icons/blue-document-xml.png";
            switch (type) {
                case "hscript":     icon = "icons/blue-document-haxe.png";
                case "css":         icon = "icons/blue-document-css.png";
            }
            
            var textview = createTextView(type, filename, icon);
            tabs.addComponent(textview);
        }
    }
    
    private static function createTextView(type:String, data:String, icon:String = null) {
        var resName:String = 'views/${data.toLowerCase()}.${type}';
        if (Resource.getString(resName) != null) {
            var view:TextView = new TextView();
            view.percentWidth = 100;
            view.percentHeight = 100;
            if (icon != null) {
                view.icon = icon;
            }
            view.text = '${data.toLowerCase()}.${type}';
            view.textContent = Resource.getString(resName);
            return view;
        }
        return null;
    }
    
    private static function items():Map<String, Array<ItemInfo>> {
        var items:Map<String, Array<ItemInfo>> = new Map<String, Array<ItemInfo>>();
        
        // general
        var array:Array<ItemInfo> = [];
            array.push(new ItemInfo("General", "Buttons", Buttons, "icons/ui-buttons.png"));
            array.push(new ItemInfo("General", "Labels", Labels, "icons/ui-labels.png"));
            array.push(new ItemInfo("General", "Checkboxes", CheckBoxes, "icons/ui-check-boxes.png"));
            array.push(new ItemInfo("General", "Optionboxes", OptionBoxes, "icons/ui-radio-buttons.png"));
            array.push(new ItemInfo("General", "Textfields", TextFields, "icons/ui-text-field.png"));
            array.push(new ItemInfo("General", "Textareas", null, "icons/ui-text-area.png"));
            array.push(new ItemInfo("General", "Images", null, "icons/images.png"));
            array.push(new ItemInfo("General", "Switches", null, "icons/ui-button-toggle.png"));
        items.set("General", array);

        // containers
        var array:Array<ItemInfo> = [];
            array.push(new ItemInfo("Containers", "Scrollviews", null, "icons/ui-scroll-pane-image.png"));
            array.push(new ItemInfo("Containers", "Listviews", null, "icons/ui-list-box-blue.png"));
            array.push(new ItemInfo("Containers", "Dropdowns", null, "icons/ui-combo-box-blue.png"));
            array.push(new ItemInfo("Containers", "Tabviews", null, "icons/ui-tab-content.png"));
            array.push(new ItemInfo("Containers", "Tableviews", null, "icons/ui-scroll-pane-table.png"));
        items.set("Containers", array);
        
        // scrolls
        var array:Array<ItemInfo> = [];
            array.push(new ItemInfo("Scrolls", "Horizontal Scrollbars", HorizontalScrollbars, "icons/ui-scroll-bar-horizontal.png"));
            array.push(new ItemInfo("Scrolls", "Vertical Scrollbars", null, "icons/ui-scroll-bar.png"));
            array.push(new ItemInfo("Scrolls", "Horizontal Progressbars", null, "icons/ui-progress-bar.png"));
            array.push(new ItemInfo("Scrolls", "Vertical Progressbars", null, "icons/ui-progress-bar-vertical.png"));
            array.push(new ItemInfo("Scrolls", "Horizontal Sliders", null, "icons/ui-seek-bar.png"));
            array.push(new ItemInfo("Scrolls", "Vertical Sliders", null, "icons/ui-seek-bar-vertical.png"));
        items.set("Scrolls", array);
        
        // layouts
        var array:Array<ItemInfo> = [];
            array.push(new ItemInfo("Layouts", "Absolute", null, "icons/ui-layered-pane.png"));
            array.push(new ItemInfo("Layouts", "Box", Boxes, "icons/ui-panel.png", ["layout-controls.xml", "layouts-shared.hscript"]));
            array.push(new ItemInfo("Layouts", "Horizontal", Horizontal, "icons/ui-split-panel.png", ["layout-controls.xml", "layouts-shared.hscript"]));
            array.push(new ItemInfo("Layouts", "Vertical", null, "icons/ui-split-panel-vertical.png"));
            array.push(new ItemInfo("Layouts", "Horizontal Grid", null, "icons/grid.png"));
            array.push(new ItemInfo("Layouts", "Vertical Grid", null, "icons/grid.png"));
            array.push(new ItemInfo("Layouts", "Horizontal Continuous", null, "icons/ui-flow.png"));
        items.set("Layouts", array);
        
        return items;
    }
}
