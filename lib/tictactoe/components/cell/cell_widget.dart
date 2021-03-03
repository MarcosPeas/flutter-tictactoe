import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_tac_toe/tictactoe/components/cell/cell_controller.dart';

class CellWidget extends StatelessWidget {
  CellController _controller = CellController();

  CellWidget(int x, int y) {
    _controller.x = x;
    _controller.y = y;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: () {
            print('${_controller.x}-${_controller.y}');
            int n = (_controller.x + _controller.y) % 2;
            _controller.cellType = n == 0 ? CellType.CROSS : CellType.CIRCLE;
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
      size: 76,
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
