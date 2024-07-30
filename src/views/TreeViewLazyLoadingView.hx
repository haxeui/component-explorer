package views;

import haxe.ui.containers.TreeViewNode;
import haxe.ui.events.TreeViewEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/treeview-lazy-loading.xml"))
class TreeViewLazyLoadingView extends View {
    public function new() {
        super();
        var root = tv1.addNode({ text: "root", icon: "icons/svg/shapes.svg"});
        root.expandable = true;
    }

    @:bind(tv1, TreeViewEvent.NODE_EXPANDED)
    private function onTV1NodeExpanded(event:TreeViewEvent) {
        var node = event.node;
        if (node.findComponents(TreeViewNode).length != 0) { // we'll assume for this example that if it has children, its already been populated
            return;
        }
        for (i in 0...Std.random(3) + 1) {
            var child = node.addNode({text: "expandable node - " + Std.random(0xff), icon: "icons/svg/shapes.svg"});
            child.expandable = true;
        }
        for (i in 0...Std.random(3) + 1) {
            node.addNode({text: "node - " + Std.random(0xff), icon: "icons/svg/tooltips.svg"});
        }
    }

    @:bind(tv1, TreeViewEvent.NODE_COLLAPSED)
    private function onTV1NodeCollapsed(event:TreeViewEvent) {
        event.node.clearNodes();
    }
}