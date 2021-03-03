import 'package:flutter_modular/flutter_modular.dart';
import 'package:tic_tac_toe/core/model/cell.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/states/player_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/tic_tac_toe_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe/modules/tictactoe/utils/winner_finder.dart';

class ProcessTableState extends TicTacToeState {
  @override
  void enter() async {
    super.enter();
    await Future.delayed(Duration(milliseconds: 150));

    TicTacToeController ticTacToeController = Modular.get<TicTacToeController>();
    WinnerFinder winnerFinder = WinnerFinder(ticTacToeController.cellModels);
    List<Cell> winnerCells = winnerFinder.findWinners();
    if (winnerCells.isEmpty) {
      ticTacToeController.changeState(PlayerState());
    } else {
      ticTacToeController.showWinnersCell(winnerCells);
      print('Acabou....');
    }
  }
}
