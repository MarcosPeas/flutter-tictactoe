import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tic_tac_toe/modules/tictactoe/components/cell/cell_controller.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_controller.dart';

class CellWidget extends StatelessWidget {
  CellController _controller = CellController();
  TicTacToeController _tacToeController = Modular.get();

  Widget _aspectRatio;

  CellWidget(int x, int y) {
    _controller.x = x;
    _controller.y = y;
    _tacToeController.addCellController(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: () {
            if (_controller.cellType == CellType.NULL) {
              _tacToeController.selectCell(_controller);
            }
          },
          child: Container(
            color: _color(),
            child: _icon(),
          ),
        ),
      );
    });
  }

  Widget _icon() {
    if (_controller.cellType == CellType.NULL) {
      return Container();
    }
    return _controller.cellType == CellType.CROSS ? _cross() : _circle();
  }

  Widget _cross() {
    return Icon(
      Icons.clear,
      size: 88,
    );
  }

  Widget _circle() {
    return Icon(
      Icons.panorama_fish_eye,
      size: 70,
    );
  }

  Color _color() {
    return _controller.selected ? Colors.orange : Color(0x00ffffff);
  }
}
