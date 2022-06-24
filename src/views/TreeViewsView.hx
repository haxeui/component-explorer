package views;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/treeviews.xml"))
class TreeViewsView extends View {
    public function new() {
        super();
        
        var root1 = tv1.addNode({ text: "root A", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
        root1.expanded = true;
            var child = root1.addNode({ text: "child A-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                var node = child.addNode({ text: "child A-1-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                var node = child.addNode({ text: "child A-1-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                var node = child.addNode({ text: "child A-1-3", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-2-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-2-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-3", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-3-1", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-3-2", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-3-3", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                        var node = child.addNode({ text: "child A-3-4", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-4", icon: "haxeui-core/styles/default/haxeui_tiny.png" });
                    var child = root1.addNode({ text: "child A-5", icon: "haxeui-core/styles/default/haxeui_tiny.png" });


        var root1 = tv2.addNode({ text: "root A", icon: "haxeui-core/styles/default/haxeui_tiny.png", count: 5 });
        root1.expanded = true;
            var child = root1.addNode({ text: "child A-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), count: 3, checked: Std.random(2) == 0 });
            child.expanded = true;
                var node = child.addNode({ text: "child A-1-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
                var node = child.addNode({ text: "child A-1-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
                var node = child.addNode({ text: "child A-1-3", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
            var child = root1.addNode({ text: "child A-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), count: 2, checked: Std.random(2) == 0 });
            child.expanded = true;
                var node = child.addNode({ text: "child A-2-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
                var node = child.addNode({ text: "child A-2-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
            var child = root1.addNode({ text: "child A-3", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), count: 4, checked: Std.random(2) == 0 });
            child.expanded = true;
                var node = child.addNode({ text: "child A-3-1", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
                var node = child.addNode({ text: "child A-3-2", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
                var node = child.addNode({ text: "child A-3-3", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
                var node = child.addNode({ text: "child A-3-4", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), checked: Std.random(2) == 0 });
            var child = root1.addNode({ text: "child A-4", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), count: 3, checked: Std.random(2) == 0 });
            var child = root1.addNode({ text: "child A-5", icon: "haxeui-core/styles/default/haxeui_tiny.png", progress: Std.random(100), count: 3, checked: Std.random(2) == 0 });
    }
}