import 'package:mobx/mobx.dart';

part 'cell_controller.g.dart';

class CellController = _CellController with _$CellController;

abstract class _CellController with Store {
  int x;
  int y;

  @observable
  bool selected = false;

  @observable
  CellType cellType = CellType.NULL;

  String get name => '$x-$y';
}

enum CellType { CROSS, CIRCLE, NULL }
