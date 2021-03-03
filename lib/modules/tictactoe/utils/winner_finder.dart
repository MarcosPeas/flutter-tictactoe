import 'package:tic_tac_toe/core/model/cell.dart';

class WinnerFinder {
  Map<String, Cell> _cells;
  List<Cell> _winners = [];

  WinnerFinder(this._cells);

  bool hasWinnerByType(CellType cellType) {
    _findDiagonal01();
    if (_winners.isNotEmpty) {
      return _winners[0].cellType == cellType;
    }
    _findDiagonal02();
    if (_winners.isNotEmpty) {
      return _winners[0].cellType == cellType;
    }
    _findHorizontal();
    if (_winners.isNotEmpty) {
      return _winners[0].cellType == cellType;
    }
    _findVertical();
    if (_winners.isNotEmpty) {
      return _winners[0].cellType == cellType;
    }
    return false;
  }

  bool isFull(){
    List<Cell> list = _cells.values.toList();
    for (Cell cell in list) {
      if(cell.cellType == null || cell.cellType == CellType.NULL){
        return false;
      }
    }
    return true;
  }

  List<Cell> findWinners() {
    _findHorizontal();
    _findVertical();
    _findDiagonal01();
    _findDiagonal02();
    return _winners;
  }

  void _findHorizontal() {
    for (int y = 0; y < 3; y++) {
      int x0 = 0;
      int x1 = 1;
      int x2 = 2;
      Cell a = _cells['$x0-$y'];
      Cell b = _cells['$x1-$y'];
      Cell c = _cells['$x2-$y'];
      _find(a, b, c);
    }
  }

  void _findVertical() {
    for (int x = 0; x < 3; x++) {
      int y0 = 0;
      int y1 = 1;
      int y2 = 2;
      Cell a = _cells['$x-$y0'];
      Cell b = _cells['$x-$y1'];
      Cell c = _cells['$x-$y2'];
      _find(a, b, c);
    }
  }

  void _findDiagonal01() {
    _find(
      _cells['0-0'],
      _cells['1-1'],
      _cells['2-2'],
    );
  }

  void _findDiagonal02() {
    _find(
      _cells['0-0'],
      _cells['1-1'],
      _cells['2-2'],
    );
  }

  void _find(Cell a, Cell b, Cell c) {
    if (a.cellType == CellType.NULL || a.cellType == null) {
      return;
    }
    if (a.cellType == b.cellType && b.cellType == c.cellType) {
      _winners.addAll([a, b, c]);
    }
  }
}
