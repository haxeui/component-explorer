package views;

import haxe.ui.constants.SortDirection;
import haxe.ui.events.UIEvent;
import haxe.ui.containers.Box;
import haxe.ui.util.StringUtil;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/box-data-sources.xml"))
class BoxDataSourcesView extends View {
    private static var ALPHABET = "abcdefghijklmnopqrstuvwxyz";
    private function generateRandomName() {
        var name = "";
        for (i in 0...3) {
            name += ALPHABET.charAt(Std.random(26));
        }
        return StringUtil.capitalizeFirstLetter(name);
    }

    @:bind(addButton, MouseEvent.CLICK)
    private function onAddButton(_) {
        var name = generateRandomName();

        if (applyToHBox.selected) {
            theHBox.dataSource.add({
                title: name,
                subTitle: name + " item description",
                otherField: name.charAt(2) + name.charAt(2) + name.charAt(2)
            });
        }

        if (applyToVBox.selected) {
            theVBox.dataSource.add({
                title: name,
                subTitle: name + " item description",
                otherField: name.charAt(2) + name.charAt(2) + name.charAt(2)
            });
        }

        if (applyToGrid.selected) {
            theGrid.dataSource.add({
                title: name,
                subTitle: name + " item description",
                otherField: name.charAt(2) + name.charAt(2) + name.charAt(2)
            });
        }
    }

    @:bind(removeButton, MouseEvent.CLICK)
    private function onRemoveButton(_) {
        if (applyToHBox.selected && theHBox.dataSource.size > 0) {
            theHBox.dataSource.removeAt(theHBox.dataSource.size - 1);
        }
        if (applyToVBox.selected && theVBox.dataSource.size > 0) {
            theVBox.dataSource.removeAt(theVBox.dataSource.size - 1);
        }
        if (applyToGrid.selected && theGrid.dataSource.size > 0) {
            theGrid.dataSource.removeAt(theGrid.dataSource.size - 1);
        }
    }

    @:bind(editButton, MouseEvent.CLICK)
    private function onEditButton(_) {
        if (applyToHBox.selected) {
            editRandomItem(theHBox);
        }
        if (applyToVBox.selected) {
            editRandomItem(theVBox);
        }
        if (applyToGrid.selected) {
            editRandomItem(theGrid);
        }
    }

    @:bind(filterField, UIEvent.CHANGE)
    private function onFilterFieldChange(_) {
        if (applyToHBox.selected) {
            theHBox.dataSource.filter((index, item) -> item.title.toLowerCase().indexOf(filterField.text.toLowerCase()) != -1);
        }
        if (applyToVBox.selected) {
            theVBox.dataSource.filter((index, item) -> item.title.toLowerCase().indexOf(filterField.text.toLowerCase()) != -1);
        }
        if (applyToGrid.selected) {
            theGrid.dataSource.filter((index, item) -> item.title.toLowerCase().indexOf(filterField.text.toLowerCase()) != -1);
        }
    }

    @:bind(sortBySelector, UIEvent.CHANGE)
    @:bind(sortDirectionSelector, UIEvent.CHANGE)
    private function onSortBySelectorChange(_) {
        if (applyToHBox.selected) {
            applySort(theHBox);
        }
        if (applyToVBox.selected) {
            applySort(theVBox);
        }
        if (applyToGrid.selected) {
            applySort(theGrid);
        }
    }

    private function applySort(box:Box) {
        if (sortBySelector.selectedItem == null) {
            return;
        }
        var direction = SortDirection.ASCENDING;
        if (sortDirectionSelector.selectedButton != null) {
            direction = sortDirectionSelector.selectedButton.userData;
        }
        switch (sortBySelector.selectedItem.text) {
            case "none":
                box.dataSource.sortCustom((_, _, _) -> 0, direction);
            case _:
                box.dataSource.sort(sortBySelector.selectedItem.text, direction);
        }
    }

    private function editRandomItem(box:Box) {
        if (box.dataSource.size > 0) {
            var n = Std.random(box.dataSource.size);
            var item:Dynamic = box.dataSource.get(n);

            var newName = generateRandomName();
            item.title = newName;
            item.subTitle = newName + " item description";
            item.otherField = newName.charAt(2) + newName.charAt(2) + newName.charAt(2);

            box.dataSource.update(n, item);
            box.invalidateComponentData();
        }
    }
}