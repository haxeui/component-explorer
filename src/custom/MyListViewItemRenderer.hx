package custom;

import haxe.ui.core.ItemRenderer;

@:xml('
<item-renderer width="100%" layout="horizontal">
    <image id="theIcon"  verticalAlign="center" />
    <label id="theLabel" width="100%" verticalAlign="center" />
    <button id="theButton" width="90" />
    <button id="theDeleteButton" text="Delete" width="90" />
</item-renderer>
')
class MyListViewItemRenderer extends ItemRenderer {
    private override function onDataChanged(data:Dynamic) {
        super.onDataChanged(data);
        if (data == null) { // TODO: should change call so onDataChange only ever gets called when non-null
            return;
        }

        var fullName = data.firstName + " " + data.lastName + " (" + data.username + ")";
        theLabel.text = fullName;

        if (data.active == "true") { // TODO: need to autoconvert basic types (this used to work!)
            theIcon.resource = "haxeui-core/styles/shared/tick-small.png";
            theButton.text = "Deactivate";
            theDeleteButton.disabled = true;
        } else {
            theIcon.resource = "haxeui-core/styles/shared/error-small.png";
            theButton.text = "Activate";
            theDeleteButton.disabled = false;
        }
    }
}