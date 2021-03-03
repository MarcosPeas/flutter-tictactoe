import 'dart:math';

import 'package:tic_tac_toe/core/model/cell.dart';
import 'package:tic_tac_toe/modules/tictactoe/ia/mini_max_board.dart';
import 'package:tic_tac_toe/modules/tictactoe/utils/winner_finder.dart';

class MiniMaxNode {
  MiniMaxNode _parent;
  List<MiniMaxNode> _children = [];

  MiniMaxBoard _board;

  int _points = 0;
  bool _iaTurn;
  Cell _selectedCell;

  MiniMaxNode(Map<String, Cell> cells) {
    _board = MiniMaxBoard.fromCells(cells);
  }

  MiniMaxNode._fromBoard(MiniMaxBoard board, MiniMaxNode parent, bool iaTurn) {
    _board = MiniMaxBoard.fromMiniMaxBoard(board);
    this._parent = parent;
    this._iaTurn = iaTurn;
  }

  Cell result() {
    List<Cell> validMovements = _board.validMovements();
    validMovements.forEach((cell) {
      MiniMaxBoard board = MiniMaxBoard.fromMiniMaxBoard(_board);
      Cell moveCell = Cell();
      moveCell.x = cell.x;
      moveCell.y = cell.y;
      moveCell.cellType = CellType.CROSS;
      board.selectCell(cell);
      MiniMaxNode node = MiniMaxNode._fromBoard(board, this, true);
      node._selectedCell = cell;
      _children.add(node);
      node._result();
    });
    return _topMove();
  }

  void _result() {
    CellType type = _iaTurn ? CellType.CROSS : CellType.CIRCLE;
    int points = _iaTurn ? 1 : -1;
    if (_board.hasWinnerWidth(type)) {
      _points = points;
      return;
    }
    if (_board.isFull()) {
      _points = 0;
      return;
    }
    _executeMoves();
  }

  void _executeMoves() {
    List<Cell> moves = _board.validMovements();
    moves.forEach((cell) {
      MiniMaxBoard board = MiniMaxBoard.fromMiniMaxBoard(_board);
      Cell moveCell = Cell();
      moveCell.x = cell.x;
      moveCell.y = cell.y;
      moveCell.cellType = _iaTurn ? CellType.CIRCLE : CellType.CROSS;
      board.selectCell(moveCell);
      MiniMaxNode node = MiniMaxNode._fromBoard(board, this, !_iaTurn);
      node._selectedCell = cell;
      _children.add(node);
      node._result();
    });
    _points = _miniMax();
  }

  int _miniMax() {
    return _iaTurn ? _mini() : _max();
  }

  int _mini() {
    int mini = double.maxFinite.round();
    _children.forEach((node) {
      mini = node._points < mini ? node._points : mini;
    });
  }

  int _max() {
    int max = -double.infinity.round();
    _children.forEach((node) {
      max = node._points > max ? node._points : max;
    });
  }

  Cell _topMove() {
    int maxValue = _maxValue();
    List<Cell> cells = [];
    _children.forEach((node) {
      if (node._points == maxValue) {
        cells.add(node._selectedCell);
      }
    });
    return _selectRandomCell(cells);
  }

  int _maxValue() {
    int max = -double.infinity.round();
    _children.forEach((node) {
      if (node._points > max) {
        max = node._points;
      }
    });
  }

  Cell _selectRandomCell(List<Cell> cells) {
    int count = cells.length;
    int pos = Random().nextInt(count);
    return cells[pos];
  }
}
