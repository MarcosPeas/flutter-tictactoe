import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tic_tac_toe/modules/tictactoe/components/menus/start_manu.dart';
import 'package:tic_tac_toe/modules/tictactoe/components/table/table_widget.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/states/start_menu_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_controller.dart';

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends ModularState<TicTacToePage, TicTacToeController> {

  TableWidget _tableWidget;

  @override
  void initState() {
    _tableWidget = TableWidget();
    controller.changeState(StartMenuState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(
      builder: (_) {
        return Stack(
          children: [
            Container(
              color: Color(0xffe3f2fd),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _tableWidget,
            ),
            _startMenu()
          ],
        );
      },
    ));
  }

  Widget _startMenu() {
    return Visibility(visible: controller.currentState is StartMenuState, child: StartMenu(controller));
  }
}
