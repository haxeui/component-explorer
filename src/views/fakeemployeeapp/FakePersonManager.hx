package views.fakeemployeeapp;

import fakedata.FakePerson;
import haxe.ui.containers.windows.WindowManager;

class FakePersonManager {
    private static var _instance:FakePersonManager;
    public static var instance(get, null):FakePersonManager;
    private static function get_instance():FakePersonManager {
        if (_instance == null) {
            _instance = new FakePersonManager();
        }
        return _instance;
    }

    //****************************************************************************************************
    // Instance
    //****************************************************************************************************
    public var windowManager = new WindowManager();

    private function new() {
    }

    public function showPersonDetails(person:FakePerson) {
        var window = findPersonWindow(person);
        if (window == null) {
            window = new FakePersonDetailsWindow();
            window.person = person;
            windowManager.addWindow(window);
        } else {
            windowManager.bringToFront(window);
        }
    }

    public function showDepartmentDetails(department:String) {
        var window = findDepartmentWindow(department);
        if (window == null) {
            window = new FakeDepartmentDetailsWindow();
            window.department = department;
            windowManager.addWindow(window);
        } else {
            windowManager.bringToFront(window);
        }
    }

    public function showEmail(to:String, subject:String) {
        var window = new FakeEmailWindow();
        window.to = to;
        window.subject = subject;
        windowManager.addWindow(window);
    }

    private function findPersonWindow(person:FakePerson):FakePersonDetailsWindow {
        for (w in windowManager.windows) {
            if ((w is FakePersonDetailsWindow)) {
                var personWindow = cast(w, FakePersonDetailsWindow);
                if (personWindow.person == person) {
                    return personWindow;
                }
            }
        }
        return null;
    }

    private function findDepartmentWindow(department:String):FakeDepartmentDetailsWindow {
        for (w in windowManager.windows) {
            if ((w is FakeDepartmentDetailsWindow)) {
                var departmentWindow = cast(w, FakeDepartmentDetailsWindow);
                if (departmentWindow.department == department) {
                    return departmentWindow;
                }
            }
        }
        return null;
    }
}