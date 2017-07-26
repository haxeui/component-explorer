package;
import haxe.ui.core.Component;

class ItemInfo {
    public var group:String;
    public var name:String;
    public var view:Class<Component>;
    public var icon:String;
    public var additionalFiles:Array<String> = [];
    
    public function new(group:String, name:String, view:Class<Component>, icon:String = null, additionalFiles:Array<String> = null) {
        this.group = group;
        this.name = name;
        this.view = view;
        this.icon = icon;
        if (additionalFiles != null) {
            this.additionalFiles = additionalFiles;
        }
    }
    
    public var viewName(get, null):String;
    private function get_viewName():String {
        if (view == null) {
            return null;
        }
        var className:String = Type.getClassName(view);
        return className.split(".").pop();
    }
}