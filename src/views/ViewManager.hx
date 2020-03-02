package views;

import haxe.Resource;
import haxe.ui.containers.Box;
import haxe.ui.containers.TabView;
import haxe.ui.editors.code.CodeEditor;
import util.Logger;

typedef ViewInfo = {
    var title:String;
    var smallIcon:String;
    var largeIcon:String;
    var viewClass:Class<View>;
    @:optional var relevantFiles:Array<String>;
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
    public function registerView(info:ViewInfo) {
        views.push(info);
    }
    
    public function showView(info:ViewInfo) {
        viewTabs.removeAllPages();
        
        var viewContainer = new Box();
        viewContainer.percentWidth = 100;
        viewContainer.percentHeight = 100;
        viewContainer.addClass("view-container");
        viewContainer.text = info.title;
        viewContainer.icon = info.smallIcon;
        
        var view:View = Type.createInstance(info.viewClass, []);
        view.percentWidth = 100;
        view.percentHeight = 100;
        viewContainer.addComponent(view);
        
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
        
        /*
        var textarea = new TextArea();
        textarea.percentWidth = 100;
        textarea.percentHeight = 100;
        textarea.wrap = false;
        textarea.text = Resource.getString(file);        
        viewContainer.addComponent(textarea);
        */
        var editor = new CodeEditor();
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
        //text = StringTools.replace(text, "\\n", "\\n");
        editor.text = text;
        viewContainer.addComponent(editor);
        
        viewTabs.addComponent(viewContainer);
    }
    
    private function iconForExtension(ext:String):String {
        var icon = "icons/16/document_empty.png";
        switch (ext) {
            case "xml":
                icon = "icons/16/document_editing.png";
        }
        return icon;
    }
}