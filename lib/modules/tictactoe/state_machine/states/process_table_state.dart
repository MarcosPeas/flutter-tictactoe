import 'package:flutter_modular/flutter_modular.dart';
import 'package:tic_tac_toe/core/model/cell.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/states/player_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/tic_tac_toe_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe/modules/tictactoe/utils/winner_finder.dart';

class ProcessTableState extends TicTacToeState {
  List<Cell> _winnerList = [];
  TicTacToeController _ticTacToeController;

  @override
  void enter() async {
    super.enter();
    await Future.delayed(Duration(milliseconds: 150));
    _ticTacToeController = Modular.get<TicTacToeController>();
    WinnerFinder winnerFinder = WinnerFinder(_ticTacToeController.cellModels);
    _winnerList = winnerFinder.findWinners();
    _next();
  }

  void _next() {
    if (_winnerList.isEmpty) {
      _ticTacToeController.changeState(PlayerState());
    } else {
      _ticTacToeController.showWinnersCell(_winnerList);
      print('Acabou....');
    }
  }
}
