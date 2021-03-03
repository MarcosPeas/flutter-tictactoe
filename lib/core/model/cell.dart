class Cell {
  int _x;
  int _y;

  CellType _cellType;

  Cell();

  Cell.xy(this._x, this._y);

  String get name => '$_x-$_y';

  int get x => _x;

  set x(int value) {
    _x = value;
  }

  int get y => _y;

  CellType get cellType => _cellType;

  set cellType(CellType value) {
    _cellType = value;
  }

  set y(int value) {
    _y = value;
  }
}

enum CellType { CROSS, CIRCLE, NULL }
