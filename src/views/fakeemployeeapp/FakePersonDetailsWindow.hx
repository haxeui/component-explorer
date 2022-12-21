package views.fakeemployeeapp;

import fakedata.FakePerson;
import haxe.ui.containers.dialogs.Dialog.DialogButton;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import haxe.ui.events.MouseEvent;
import haxe.ui.containers.windows.Window;

using haxe.ui.animation.AnimationTools;

@:xml('
<window width="440" height="500" left="10" top="10">
    <style>
        .field-label {
            font-weight: bold;
            color: $accent-color-darker;
        }
    </style>
    <vbox width="100%" height="100%" style="spacing:10px;">
        <tabview width="100%" styleName="rounded-tabs">
            <hbox text="Details" width="100%" style="padding: 10px;spacing:20px;">
                <box width="128" height="128">
                    <image id="personImage" width="128" height="128" style="border-radius: 4px;border:1px solid $accent-color;" />
                    <!-- i mean, why not! :D -->
                    <box verticalAlign="bottom" horizontalAlign="right" style="background-color: white;background-opacity: .7;border:1px solid $accent-color;border-radius: 0px;padding-top:5px;margin-right:-2px;margin-bottom:-2px;border-bottom-right-radius: 4px;border-top-left-radius: 4px;">
                        <mini-graph width="50" height="16" />
                    </box>
                </box>
                <grid width="100%">
                    <label text="Full Name:" styleName="field-label" />
                    <label id="personFullName" width="100%" />

                    <label text="DoB:" styleName="field-label" />
                    <label id="personDoB" width="100%" />

                    <label text="Department: " styleName="field-label" />
                    <label id="personDepartment" width="100%" />

                    <label text="Role:" styleName="field-label" />
                    <label id="personRole" width="100%" />

                    <label text="Email:" styleName="field-label" />
                    <link id="personEmail" width="100%" />

                    <label text="Address:" styleName="field-label" />
                    <label id="personAddress" width="100%" />
                </grid>
            </hbox>    
            <box text="Additional Details" />
            <box text="Next Of Kin" />
        </tabview>
        <tabview width="100%" height="100%" tabPosition="bottom" styleName="rounded-tabs">
            <vbox text="Notes" width="100%" height="100%">
                <textarea width="100%" height="100%" text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae leo ut dolor maximus pharetra sed at tortor. Phasellus sed nunc nec lorem sagittis dictum. Praesent leo urna, mollis ac ipsum nec, lobortis rutrum tortor. Fusce suscipit convallis elit, eget rutrum dolor blandit quis. Donec efficitur congue elit, sit amet tincidunt nisi sagittis vitae. Vivamus auctor nisl nec odio vestibulum, finibus consectetur eros pellentesque. Aliquam in sem in nulla scelerisque mattis et quis lorem.\n\nVestibulum nec nulla vitae leo imperdiet rhoncus. Suspendisse in purus sit amet odio bibendum varius. Nulla facilisi. Mauris maximus turpis ut fermentum dictum. Donec pharetra rhoncus ex et tincidunt. Etiam pellentesque fermentum bibendum. Aenean consequat ligula ex, vitae viverra est varius a. Integer non elementum mi. Nullam egestas est semper tellus consequat malesuada. Phasellus tincidunt lacus felis, vitae lobortis tellus mattis a. Donec fringilla lacus id venenatis auctor.\n\nAenean fermentum fermentum eros. Maecenas et magna nisl. Mauris a nisl a turpis congue pharetra et quis nunc. Sed suscipit scelerisque turpis, sit amet aliquet dui sollicitudin id. In ut neque sit amet ligula venenatis interdum. Fusce ornare dolor nisi, nec sollicitudin ex tempor a. Sed mattis tincidunt justo, non dictum metus accumsan ut. Nulla vel laoreet magna." />
                <button id="updateButton" text="Update" horizontalAlign="right" />
            </vbox>
            <vbox text="History" width="100%" height="100%" />
        </tabview>
    </vbox>
</window>
')
class FakePersonDetailsWindow extends Window {
    private var _person:FakePerson = null;
    public var person(get, set):FakePerson;
    private function get_person():FakePerson {
        return _person;
    }
    private function set_person(value:FakePerson):FakePerson {
        _person = value;
        updatePersonUI(_person);
        return value;
    }

    private function updatePersonUI(value:FakePerson) {
        title = value.firstName + " " + value.lastName + " (" + value.jobRole + ")";
        personImage.resource = value.image;
        personFullName.text = value.firstName + " " + value.lastName;
        personDoB.text = value.dob;
        personDepartment.text = value.department;
        personRole.text = value.jobRole;
        personEmail.text = value.emailAddress;
        personAddress.text = value.address;
    }

    @:bind(personEmail, MouseEvent.CLICK)
    private function onPersonEmailClick(_) {
        FakePersonManager.instance.showEmail(person.emailAddress, "Hello, " + person.firstName + " " + person.lastName);
    }

    @:bind(updateButton, MouseEvent.CLICK)
    private function onUpdateClick(_) {
        fakeUpdateNotes();
    }

    private function fakeUpdateNotes() {
        var success = Std.random(2) == 1; // will "fail" randomly
        if (success) {
            messageBox("Notes successfully updated for '" + person.firstName + " " + person.lastName + "'\n\nClick 'OK' to dismissed this message", "Notes Updated");
        } else {
            var dialog = messageBox("Notes successfully updated for '" + person.firstName + " " + person.lastName + "'\n\nDo you wish to retry?", "Failed To Update", MessageBoxType.TYPE_QUESTION, function (button) {
                if (button == DialogButton.YES) {
                    fakeUpdateNotes();
                }
            });
            dialog.shake();
        }
    }
}