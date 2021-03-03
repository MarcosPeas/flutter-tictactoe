import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe/core/model/cell.dart' as model;
import 'package:tic_tac_toe/modules/tictactoe/components/cell/cell_controller.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/states/player_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/states/process_table_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/tic_tac_toe_state.dart';

part 'tic_tac_toe_controller.g.dart';

class TicTacToeController = _TicTacToeController with _$TicTacToeController;

abstract class _TicTacToeController with Store {
  Map<String, CellController> cellControllers = HashMap();
  Map<String, model.Cell> cellModels = HashMap();

  @observable
  TicTacToeState currentState;

  void changeState(TicTacToeState state) {
    currentState?.exit();
    currentState = state;
    currentState?.enter();
  }

  void addCellController(CellController cellController) {
    cellControllers[cellController.name] = cellController;
    cellModels[cellController.name] = model.Cell.xy(cellController.x, cellController.y);
  }

  void selectCell(CellController selectedCellController) {
    if (currentState is! PlayerState) return;

    CellController cellController = cellControllers[selectedCellController.name];
    model.Cell cellModel = cellModels[selectedCellController.name];

    cellController.cellType = CellType.CROSS;
    cellModel.cellType = model.CellType.CROSS;
    changeState(ProcessTableState());
  }

  void showWinnersCell(List<model.Cell> cells) {
    List<String> keys = cells.map((e) => e.name).toList();
    cellControllers.forEach((key, value) {
      if (keys.contains(key)) {
        value.selected = true;
      }
    });
  }
}
