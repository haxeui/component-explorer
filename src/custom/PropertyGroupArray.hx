package custom;

import haxe.ui.events.UIEvent;
import haxe.ui.core.Component;
import haxe.ui.containers.properties.Property;
import haxe.ui.events.MouseEvent;
import haxe.ui.containers.properties.PropertyGroup;

@:xml('
<property-group>
    <header verticalAlign="center" style="spacing: 5px;">
        <label id="countLabel" styleName="mini-badge" verticalAlign="center" text="0 items" style="font-size: 10px" />
        <button id="addButton" text="+" style="font-size: 10px; padding: 3px 6px;" />
    </header>
</property-group>
')
class PropertyGroupArray extends PropertyGroup {
    @:bind(addButton, MouseEvent.CLICK)
    private function onAddButton(_) {
        var newProp = new PropertyArrayItem();
        newProp.value = Std.random(0xffffff);
        var n = findComponents(Property).length;
        newProp.label = "Color " + n;
        addComponent(newProp);
        updateCountLabel();
    }

    private function updateCountLabel() {
        var n = findComponents(Property).length;
        if (n == 1) {
            countLabel.text = n + " item";
        } else {
            countLabel.text = n + " items";
        }
        this.collapsed = !(n > 0);
    }

    public override function removeComponent(child:Component, dispose:Bool = true, invalidate:Bool = true):Component {
        var r = super.removeComponent(child, dispose, invalidate);
        updateCountLabel();
        var n = 0;
        for (prop in findComponents(Property)) {
            prop.label = "Color " + n;
            n++;
        }
        return r;
    }
}

@:xml('
<property type="color">
    <hbox verticalAlign="center" width="100%" style="padding-right: 5px">
        <label width="100%" verticalAlign="center" />
        <image id="deleteButton" resource="icons/actions/delete.png" verticalAlign="center" style="pointer-events:all" />
    </hbox>
</property>
')
private class PropertyArrayItem extends Property {
    @:bind(deleteButton, MouseEvent.CLICK)
    private function onDeleteButton(_) {
        findAncestor(PropertyGroupArray).removeComponent(this);
    }
}