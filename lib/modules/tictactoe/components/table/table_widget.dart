import 'package:flutter/material.dart';
import 'package:tic_tac_toe/modules/tictactoe/components/cell/cell_widget.dart';

class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: _table(),
      ),
    );
  }

  Widget _table() {
    return Table(
      border: TableBorder.symmetric(inside: BorderSide(color: Colors.blue[800], width: 2)),
      children: _tableRowList(),
    );
  }

  List<TableRow> _tableRowList() {
    List<TableRow> tableRowList = [];
    for (int x = 0; x < 3; x++) {
      List<Widget> cellList = [];
      for (int y = 0; y < 3; y++) {
        cellList.add(CellWidget(x, y));
      }
      tableRowList.add(TableRow(children: cellList));
    }
    return tableRowList;
  }
}