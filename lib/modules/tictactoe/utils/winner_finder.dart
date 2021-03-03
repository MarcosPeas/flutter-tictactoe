import 'package:tic_tac_toe/core/model/cell.dart';

class WinnerFinder {
  Map<String, Cell> _cells;
  List<Cell> _winners = [];

  WinnerFinder(this._cells);

  List<Cell> findWinners() {
    _findHorizontal();
    _findVertical();
    _findDiagonal();
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

  void _findDiagonal() {
    _find(
      _cells['0-0'],
      _cells['1-1'],
      _cells['2-2'],
    );
    _find(
      _cells['1-2'],
      _cells['1-1'],
      _cells['2-1'],
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
