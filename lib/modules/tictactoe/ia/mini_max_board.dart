import 'dart:collection';

import 'package:tic_tac_toe/core/model/cell.dart';
import 'package:tic_tac_toe/modules/tictactoe/utils/winner_finder.dart';

class MiniMaxBoard {
  Map<String, Cell> _cells = HashMap();

  MiniMaxBoard.fromCells(Map<String, Cell> cells) {
    cells.forEach((key, c) {
      Cell cell = Cell.xy(c.x, c.y);
      cell.cellType = c.cellType;
      _cells[key] = cell;
    });
  }

  MiniMaxBoard.fromMiniMaxBoard(MiniMaxBoard other) {
    other?._cells?.forEach((key, c) {
      Cell cell = Cell.xy(c.x, c.y);
      cell.cellType = c.cellType;
      _cells[key] = cell;
    });
  }

  List<Cell> validMovements() {
    return _cells.values.where((cell) => cell.cellType == null || cell.cellType == CellType.NULL);
  }

  void selectCell(Cell cell) {
    _cells[cell.name] = cell;
  }

  bool hasWinnerWidth(CellType type) {
    WinnerFinder finder = WinnerFinder(_cells);
    return finder.hasWinnerByType(type);
  }

  bool isFull() {
    WinnerFinder finder = WinnerFinder(_cells);
    return finder.isFull();
  }
}
