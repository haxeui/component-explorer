package views;
import haxe.ui.events.UIEvent;
import haxe.ui.util.Timer;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/tableviews.xml"))
class TableViewsView extends View {
    private var _timer:Timer;
    
    public function new() {
        super();
        
        for (i in 0...6) {
            tv4.dataSource.add(createRandomItem());
        }
        
        _timer = new Timer(100, function() {
            updateRandomItem();
        });
    }
    
    @:bind(tv6Filter, UIEvent.CHANGE)
    private function ontv6FilterChange(_) {
        if (tv6Filter.text == null || tv6Filter.text == "") {
            tv6.dataSource.clearFilter();
        } else {
            tv6.dataSource.filter(function(index, data) {
                return data.name.toLowerCase().indexOf(tv6Filter.text.toLowerCase()) != -1;
            });
        }
    }
    
    public override function disposeComponent() {
        _timer.stop();
        _timer = null;
        super.disposeComponent();
    }
    
    private function createRandomItem():Dynamic  {
        var d:Dynamic = {};
        
        d.colA = (Std.random(2) == 0);
        var imageIndex = Std.random(4);
        switch (imageIndex) {
            case 0: d.colX = "icons/Status_Available.png";
            case 1: d.colX = "icons/Status_None.png";
            case 2: d.colX = "icons/Status_Partially.png";
            case 3: d.colX = "icons/Status_Unavailable.png";
        }
        d.colB = Std.random(100);
        d.colC = "Status " + Std.random(1000);
        
        return d;
    }
    
    private function updateRandomItem() {
        var index = Std.random(tv1.dataSource.size);
        tv4.dataSource.update(index, createRandomItem());
    }
}