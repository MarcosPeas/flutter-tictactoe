import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tic_tac_toe/app/app_widget.dart';
import 'package:tic_tac_toe/modules/splash/splash_screen.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_controller.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind((i) => TicTacToeController)];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashScreen()),
        ModularRouter('/tic_tac_toe',
            module: TicTacToeModule(),
            transition: TransitionType.size,
            duration: Duration(milliseconds: 1200))
      ];
}
