import 'package:flutter/material.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/states/player_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/state_machine/states/prepare_state.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_controller.dart';

class StartMenu extends StatelessWidget {
  TicTacToeController _tacToeController;

  StartMenu(this._tacToeController);

  @override
  Widget build(BuildContext context) {
    return _stack();
  }

  Widget _stack() {
    return Stack(
      children: [_background(), _menu()],
    );
  }

  Widget _background() {
    return Container(
      color: Color(0x99000000),
    );
  }

  Widget _menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Jogo da Velha',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            onPressed: () {
              _tacToeController.changeState(PlayerState());
            },
            child: Text('Iniciar'),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
