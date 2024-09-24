package custom;

import haxe.ui.events.UIEvent;
import haxe.ui.containers.properties.PropertyGroup;

@:xml('
<property-group>
    <header verticalAlign="center" style="spacing: 5px;">
        <label id="labelX" styleName="mini-badge" style="font-size: 10px" />
        <label id="labelY" styleName="mini-badge" style="font-size: 10px" />
        <label id="labelZ" styleName="mini-badge" style="font-size: 10px" />
    </header>
    <property id="propX" label="X" type="number" value="1" />
    <property id="propY" label="Y" type="number" value="2" />
    <property id="propZ" label="Z" type="number" value="3" />
</property-group>
')
class PropertyGroupVector extends PropertyGroup {
    @:bind(propX, UIEvent.CHANGE)
    @:bind(propY, UIEvent.CHANGE)
    @:bind(propZ, UIEvent.CHANGE)
    private function onPropChange(_) {
        labelX.text = "X: " + propX.value;
        labelY.text = "Y: " + propY.value;
        labelZ.text = "Z: " + propZ.value;
    }
}