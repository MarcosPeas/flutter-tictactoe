import 'package:flutter/material.dart';
import 'package:tic_tac_toe/modules/tictactoe/components/cell/cell_widget.dart';

class TableWidget extends StatelessWidget {
  List<TableRow> _tableRowList = [];

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
    print('Criando elementos da tabela');
    return Table(
      border: TableBorder.symmetric(inside: BorderSide(color: Colors.blue[800], width: 2)),
      children: _createTableRowList(),
    );
  }

  List<TableRow> _createTableRowList() {
    if (_tableRowList.isEmpty) {
      for (int x = 0; x < 3; x++) {
        List<Widget> cellList = [];
        for (int y = 0; y < 3; y++) {
          cellList.add(CellWidget(x, y));
        }
        _tableRowList.add(TableRow(children: cellList));
      }
    }
    return _tableRowList;
  }
}
