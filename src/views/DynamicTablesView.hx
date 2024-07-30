package views;

import haxe.ui.data.ArrayDataSource;
import haxe.ui.components.Column;
import haxe.ui.containers.TableView;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/dynamic-tables.xml"))
class DynamicTablesView extends View {
    @:bind(createDynamicTableButton, MouseEvent.CLICK)
    private function onCreateDynamicTableButton(_) {
        var tv = createDynamicTable();
        tableContainer.addComponent(tv);
    }

    @:bind(reuseDynamicTableButton, MouseEvent.CLICK)
    private function onReuseDynamicTableButton(_) {
        for (tv in tableContainer.findComponents(TableView)) {
            reuseDynamicTable(tv);
        }
    }

    private function reuseDynamicTable(tv:TableView)  {
        tv.clearContents(true);
        createTableColumnsAndData(tv);
    }

    private function createDynamicTable():TableView {
        var tv = new TableView();
        tv.width = 300; tv.height = 200;
        createTableColumnsAndData(tv);
        return tv;
    }

    private function createTableColumnsAndData(tv:TableView) {
        var columnCount = Std.random(5) + 5;
        var columnIds = [];
        for (_ in 0...columnCount) {
            var columnId = "col" + Std.random(0xff);
            var column = new Column();
            column.id = columnId;
            column.text = columnId;
            column.width = 100;
            columnIds.push(columnId);
            var c = tv.addColumn(columnId);
            c.id = columnId;
            c.width = 100;
        }

        var ds = new ArrayDataSource<Dynamic>();
        for (i in 0...10) {
            var item = {};
            for (columnId in columnIds) {
                Reflect.setField(item, columnId, columnId + "-" + i);
            }
            ds.add(item);
        }
        tv.dataSource = ds;
    }
}