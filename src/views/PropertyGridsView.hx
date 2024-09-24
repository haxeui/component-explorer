package views;

import haxe.ui.util.Variant;
import haxe.ui.containers.properties.PropertyGrid;
import haxe.ui.containers.properties.PropertyEditor;

using StringTools;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/propertygrids.xml"))
class PropertyGridsView extends View {
    public function new() {
        super();
        PropertyGrid.registerEditor("rotation-xyz", RotationEditor);
    }
}

@:xml('
<hbox width="100%" style="padding-left: 5px;padding-right: 5px;spacing:0">
    <label text="X:" verticalAlign="center" style="font-weight: bold" />
    <textfield id="fieldX" width="100%" styleName="no-border" style="text-align:center;padding: 6px 0px;" />
    <label text="Y:" verticalAlign="center" style="font-weight: bold" />
    <textfield id="fieldY" width="100%" styleName="no-border" style="text-align:center;padding: 6px 0px;" />
    <label text="Z:" verticalAlign="center" style="font-weight: bold" />
    <textfield id="fieldZ" width="100%" styleName="no-border" style="text-align:center;padding: 6px 0px;" />
</hbox>
')
private class RotationEditor extends PropertyEditor {
    private override function applyValue(value:Variant) {
        trace("value", value);
        var parts = value.toString().split(";");
        fieldX.text = parts[0];
        fieldY.text = parts[1];
        fieldZ.text = parts[2];
    }
}
