package views.fakeemployeeapp;

import haxe.ui.events.UIEvent;
import haxe.ui.containers.windows.WindowManager;
import fakedata.FakePeopleDB;
import haxe.ui.containers.VBox;

@:build(haxe.ui.macros.ComponentMacros.build("main-view.xml"))
class MainView extends View {
    public function new() {
        super();

        FakePersonManager.instance.windowManager.container = mdiContainer;
        WindowManager.instance.container = mdiContainer;
        mdiWindowList.windowManager = FakePersonManager.instance.windowManager;

        populatePeopleTree();
    }

    private function populatePeopleTree() {
        var departments = FakePeopleDB.instance.fetchPeopleByDepartment();
        for (department in departments.keys()) {
            var people = departments.get(department);
            var departmentNode = peopleTree.addNode({text: department, count: people.length});
            for (person in people) {
                departmentNode.addNode({text: person.firstName + " " + person.lastName, icon: person.image, jobRole: person.jobRole});
            }
            //departmentNode.expanded = true;
        }
    }

    @:bind(peopleTree, UIEvent.CHANGE)
    private function onPersonListChanged(_) {
        var selection = peopleTree.selectedNode.text;
        var person = FakePeopleDB.instance.fetchPerson(selection);
        if (person != null) {
            FakePersonManager.instance.showPersonDetails(person);
        } else {
            FakePersonManager.instance.showDepartmentDetails(selection);
        }
    }

    private override function onHidden() {
        WindowManager.instance.reset();
    }
}