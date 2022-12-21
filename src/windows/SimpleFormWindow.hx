package windows;

import haxe.ui.containers.windows.Window;

@:xml('
    <window title="Simple Form" width="350">
        <window-title width="100%">
            <color-picker-popup />
        </window-title>
        <grid width="100%">
            <label text="First Name:" verticalAlign="center" />
            <textfield placeholder="Enter First Name" width="100%" />

            <label text="Last Name:" verticalAlign="center" />
            <textfield placeholder="Enter Last Name" width="100%" />
        </grid>
        <window-footer width="100%">
            <dropdown width="100">
                <data>
                    <item text="Item 1" />
                    <item text="Item 2" />
                    <item text="Item 3" />
                    <item text="Item 4" />
                    <item text="Item 5" />
                    <item text="Item 6" />
                    <item text="Item 7" />
                    <item text="Item 8" />
                    <item text="Item 9" />
                </data>
            </dropdown>
            <spacer width="100%" />
            <button text="Action1" />
            <button text="Action2" />
        </window-footer>
    </window>
')
class SimpleFormWindow extends Window {
    
}