package views;

import haxe.Resource;
import haxe.ui.components.Image;
import haxe.ui.containers.Box;
import haxe.ui.containers.ScrollView;
import haxe.ui.containers.TabView;
import util.Logger;

typedef ViewInfo = {
    var title:String;
    var smallIcon:String;
    var largeIcon:String;
    var viewClass:Class<View>;
    @:optional var relevantFiles:Array<String>;
    @:optional var group:String;
    @:optional var subGroup:String;
}

class ViewManager {
    private static var _instance:ViewManager;
    public static var instance(get, null):ViewManager;
    private static function get_instance():ViewManager {
        if (_instance == null) {
            _instance = new ViewManager();
        }
        return _instance;
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    public var viewTabs:TabView = null;
    
    public function new() {
    }

    public var views:Array<ViewInfo> = [];
    public var viewGroups:Map<String, Array<ViewInfo>> = [];
    public function registerView(info:ViewInfo) {
        var groupName = info.group;
        if (groupName == null) {
            groupName = "Ungrouped";
        }
        views.push(info);
        
        if (info.subGroup == null) {
            var list = viewGroups.get(groupName);
            if (list == null) {
                list = [];
                viewGroups.set(groupName, list);
            }
            list.push(info);
        }
    }
    
    public function getItemsFromSubGroup(subGroup:String):Array<ViewInfo> {
        var items = [];
        for (v in views) {
            if (v.subGroup == subGroup) {
                items.push(v);
            }
        }
        return items;
    }
    
    public function showView(info:ViewInfo) {
        viewTabs.removeAllPages();
        
        var viewContainer = new Box();
        viewContainer.percentWidth = 100;
        viewContainer.percentHeight = 100;
        viewContainer.addClass("view-container");
        viewContainer.text = info.title;
        viewContainer.icon = info.smallIcon;
        
        var scrollview = new ScrollView();
        scrollview.addClass("view-container-scrollview");
        scrollview.percentWidth = 100;
        scrollview.percentHeight = 100;
        scrollview.percentContentWidth = 100;
        viewContainer.addComponent(scrollview);
        
        var view:View = Type.createInstance(info.viewClass, []);
        view.percentWidth = 100;
        if (view.percentHeight == 100) {
            scrollview.percentContentHeight = 100;
        }
        //view.percentHeight = 100;
        scrollview.addComponent(view);
        
        viewTabs.addComponent(viewContainer);
        viewTabs.pageIndex = 0;
        
        for (f in info.relevantFiles) {
            createRelevantFileView(f);
        }
        
        Logger.clear();
    }
    
    private function createRelevantFileView(file:String) {
        var ext = file.split(".").pop();
        
        var viewContainer = new Box();
        viewContainer.text = file;
        viewContainer.icon = iconForExtension(ext);
        viewContainer.percentWidth = 100;
        viewContainer.percentHeight = 100;
        
        if (ext == "hx" || ext == "xml") {
            #if js
            var editor = new haxe.ui.editors.code.CodeEditor();
            editor.percentWidth = 100;
            editor.percentHeight = 100;
            editor.readOnly = true;
            if (ext == "hx") {
                ext = "haxe";
            } else if (ext == "xml") {
                ext = "html";
            }
            editor.language = ext;
            var text = Resource.getString(file);
            editor.text = text;
            viewContainer.addComponent(editor);
            #end
        } else if (ext == "png") {
            var viewer = new Box();
            viewer.percentWidth = 100;
            viewer.percentHeight = 100;
            var image = new Image();
            image.verticalAlign = "center";
            image.horizontalAlign = "center";
            image.resource = file;
            viewer.addComponent(image);
            viewContainer.addComponent(viewer);
        }
        
        viewTabs.addComponent(viewContainer);
    }
    
    private function iconForExtension(ext:String):String {
        var icon = "icons/16/document_empty.png";
        switch (ext) {
            case "xml":
                icon = "icons/16/document_editing.png";
            case "png":
                icon = "icons/16/image.png";
        }
        return icon;
    }
}