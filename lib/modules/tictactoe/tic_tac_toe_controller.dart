import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe/modules/tictactoe/components/cell/cell_controller.dart';
import 'package:tic_tac_toe/state_machine/states/player_state.dart';
import 'package:tic_tac_toe/state_machine/states/process_table_state.dart';
import 'package:tic_tac_toe/state_machine/tic_tac_toe_state.dart';

part 'tic_tac_toe_controller.g.dart';

class TicTacToeController = _TicTacToeController with _$TicTacToeController;

abstract class _TicTacToeController with Store {
  List<CellController> cellControllers;

  @observable
  TicTacToeState currentState;


  void changeState(TicTacToeState state) {
    currentState?.exit();
    currentState = state;
    currentState?.enter();
  }

  void selectCell(int x, int y) {
    if (currentState is! PlayerState) return;
    var cellController = cellControllers.where((e) => e.x == x && e.y == y).first;
    cellController.cellType = CellType.CROSS;
    changeState(ProcessTableState());
  }
}
