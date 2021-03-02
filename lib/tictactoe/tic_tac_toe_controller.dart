import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe/state_machine/tic_tac_toe_state.dart';

part 'tic_tac_toe_controller.g.dart';

class TicTacToeController = _TicTacToeController with _$TicTacToeController;

abstract class _TicTacToeController with Store {
  @observable
  TicTacToeState currentState;

  void changeState(TicTacToeState state) {
    currentState?.exit();
    currentState = state;
    currentState?.enter();
  }
}
