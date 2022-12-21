package views.fakeemployeeapp;

import fakedata.FakePerson;
import fakedata.FakePeopleDB;
import haxe.ui.events.UIEvent;
import haxe.ui.data.ArrayDataSource;
import haxe.ui.containers.windows.Window;

using StringTools;

@:xml('
<window width="400" height="300">
    <window-title>
        <textfield id="filterField" placeholder="Filter" text="" />
    </window-title>
    <tableview id="membersTable" width="100%" height="100%">
        <header width="100%">
            <column text=" " id="image" width="42" />
            <column text="First Name" id="firstName" width="100" sortable="true" />
            <column text="Last Name" id="lastName" width="100" sortable="true" />
            <column text="Role" id="jobRole" width="100%" sortable="true" />
        </header>

        <item-renderer>
            <image id="image" width="32" height="32" style="border-radius: 4px" />
        </item-renderer>
        <!-- all this just so we can valign??? -->
        <item-renderer height="100%">
            <label id="firstName" verticalAlign="center" />
        </item-renderer>
        <item-renderer height="100%">
            <label id="lastName" verticalAlign="center" />
        </item-renderer>
        <item-renderer height="100%">
            <label id="jobRole" verticalAlign="center" />
        </item-renderer>
    </tableview>
    <window-footer>
        <spacer width="100%" />
        <button id="newButton" text="New Memember" />
    </window-footer>
</window>
')
class FakeDepartmentDetailsWindow extends Window {
    private var _department:String;
    public var department(get, set):String;
    private function get_department():String {
        return _department;
    }
    private function set_department(value:String):String {
        _department = value;
        updateDepartmentUI(_department);
        return value;
    }

    private function updateDepartmentUI(value:String) {
        var members = FakePeopleDB.instance.fetchDepartment(value);
        title = value;
        membersTable.dataSource = ArrayDataSource.fromArray(members);
        newButton.text = "New " + value + " Member";
    }

    @:bind(membersTable, UIEvent.CHANGE)
    private function onMembersTableChanged(_) {
        var selection = membersTable.selectedItem;
        var person = FakePeopleDB.instance.fetchPerson(selection.firstName + " " + selection.lastName);
        if (person != null) {
            FakePersonManager.instance.showPersonDetails(person);
        }
    }

    @:bind(filterField, UIEvent.CHANGE)
    private function onFilterChanged(_) {
        var text = filterField.text;
        if (text == null || text.trim().length == 0) {
            membersTable.dataSource.clearFilter();
        } else {
            membersTable.dataSource.filter((index, item) -> {
                var person = cast(item, FakePerson);
                if ((person.firstName.toLowerCase() + " " + person.lastName.toLowerCase()).contains(text)) {
                    return true;
                }
                return false;
            });
        }
    }
}