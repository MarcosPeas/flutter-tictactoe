import 'package:flutter_modular/flutter_modular.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_page.dart';

class TicTacToeModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => TicTacToeController())];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (_, a) => TicTacToePage())];
}
