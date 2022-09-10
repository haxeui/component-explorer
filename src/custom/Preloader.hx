package custom;

@:xml('
<box>
    <vbox verticalAlign="center" horizontalAlign="center">
        <image resource="images/preloader.png" horizontalAlign="center" />
        <label text="Loading explorer, please wait..." horizontalAlign="center" />
    </vbox>    
</box>
')
class Preloader extends haxe.ui.Preloader {
    private override function createChildren() { // do nothing
    }
}