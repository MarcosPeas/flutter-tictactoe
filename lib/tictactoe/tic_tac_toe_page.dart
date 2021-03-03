import 'package:flutter/material.dart';
import 'package:tic_tac_toe/state_machine/states/start_menu_state.dart';
import 'package:tic_tac_toe/tictactoe/components/menus/start_manu.dart';
import 'package:tic_tac_toe/tictactoe/components/table/table_widget.dart';
import 'package:tic_tac_toe/tictactoe/tic_tac_toe_controller.dart';

class TicTacToePage extends StatefulWidget {
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  TicTacToeController _controller = TicTacToeController();

  @override
  void initState() {
    _controller.changeState(StartMenuState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xffe3f2fd),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TableWidget(),
          ),
          //_startMenu()
        ],
      ),
    );
  }

  Widget _startMenu() {
    return StartMenu(_controller);
  }
}
