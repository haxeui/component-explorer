package views;
import custom.MiniGraph;
import custom.Noise;
import haxe.ui.components.Canvas;
import haxe.ui.styles.StyleLookupMap;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/canvas-as-icons.xml"))
class CanvasAsIconsView extends View {
    public function new() {
        super();
        
        var miniGraph = new MiniGraph();
        miniGraph.width = 50;
        miniGraph.height = 30;
        button1.icon = miniGraph;
        
        var noise = new Noise();
        noise.width = 30;
        noise.height = 30;
        
        var redNoise = new Noise();
        redNoise.onlyReds = true;
        redNoise.width = 30;
        redNoise.height = 30;
        
        var greenNoise = new Noise();
        greenNoise.onlyGreens = true;
        greenNoise.width = 30;
        greenNoise.height = 30;
        
        // so we can use them in css "lookups"
        StyleLookupMap.instance.set("noise", noise);
        StyleLookupMap.instance.set("red-noise", redNoise);
        StyleLookupMap.instance.set("green-noise", greenNoise);

        // draw olympic rings (badly)
        var olympicRings = new Canvas();
        olympicRings.width = 110;
        olympicRings.height = 50;
        olympicRings.componentGraphics.fillStyle(0xffffff, 0);
        // blue ring
        olympicRings.componentGraphics.strokeStyle(0x407ec9, 3);
        olympicRings.componentGraphics.circle(20, 20, 14);
        // black ring
        olympicRings.componentGraphics.strokeStyle(0x000000, 3);
        olympicRings.componentGraphics.circle(55, 20, 14);
        // red ring
        olympicRings.componentGraphics.strokeStyle(0xd8414f, 3);
        olympicRings.componentGraphics.circle(90, 20, 14);
        // yellow ring
        olympicRings.componentGraphics.strokeStyle(0xefb730, 3);
        olympicRings.componentGraphics.circle(38, 30, 14);
        // green ring
        olympicRings.componentGraphics.strokeStyle(0x4ea74f, 3);
        olympicRings.componentGraphics.circle(73, 30, 14);
        olympicButton.icon = olympicRings;
        
        
        var smallGraph = new MiniGraph();
        smallGraph.width = 16;
        smallGraph.height = 16;
        listview1.dataSource.add({text: "CPU 1", icon: smallGraph});
        listview1.dataSource.add({text: "CPU 2", icon: smallGraph});
        listview1.dataSource.add({text: "CPU 3", icon: smallGraph});
        listview1.dataSource.add({text: "CPU 4", icon: smallGraph});
        listview1.dataSource.add({text: "CPU 5", icon: smallGraph});
        listview1.dataSource.add({text: "CPU 6", icon: smallGraph});
        listview1.dataSource.add({text: "CPU 7", icon: smallGraph});
        listview1.dataSource.add({text: "CPU 8", icon: smallGraph});
        
        var wideGraph = new MiniGraph();
        wideGraph.width = 50;
        wideGraph.height = 16;
        listview2.dataSource.add({name: "CPU 1", graph: wideGraph});
        listview2.dataSource.add({name: "CPU 2", graph: wideGraph});
        listview2.dataSource.add({name: "CPU 3", graph: wideGraph});
        listview2.dataSource.add({name: "CPU 4", graph: wideGraph});
        listview2.dataSource.add({name: "CPU 5", graph: wideGraph});
        listview2.dataSource.add({name: "CPU 6", graph: wideGraph});
        listview2.dataSource.add({name: "CPU 7", graph: wideGraph});
        listview2.dataSource.add({name: "CPU 8", graph: wideGraph});
        
        #if !hxWidgets
        tableview1.dataSource.add({name: "CPU 1", graph: wideGraph});
        tableview1.dataSource.add({name: "CPU 2", graph: wideGraph});
        tableview1.dataSource.add({name: "CPU 3", graph: wideGraph});
        tableview1.dataSource.add({name: "CPU 4", graph: wideGraph});
        tableview1.dataSource.add({name: "CPU 5", graph: wideGraph});
        tableview1.dataSource.add({name: "CPU 6", graph: wideGraph});
        tableview1.dataSource.add({name: "CPU 7", graph: wideGraph});
        tableview1.dataSource.add({name: "CPU 8", graph: wideGraph});
        #end
        
        var groupA = treeview1.addNode({text: "Group A"});
            groupA.expanded = true;
            groupA.addNode({name: "CPU 1", checked: true, graph: wideGraph});
            groupA.addNode({name: "CPU 2", checked: true, graph: wideGraph});
        var groupB = treeview1.addNode({text: "Group A"});
            groupB.expanded = true;
            groupB.addNode({name: "CPU 3", checked: true, graph: wideGraph});
            groupB.addNode({name: "CPU 4", checked: true, graph: wideGraph});
    }
}