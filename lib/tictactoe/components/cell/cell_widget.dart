import 'package:flutter/material.dart';

class CellWidget extends StatelessWidget {
  int _x;
  int _y;

  CellWidget(this._x, this._y);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: (){
          print('$_x-$_y');
        },
        child: Container(
          color: _color(),
        ),
      ),
    );
  }

  Color _color() {
    return (_x + _y) % 2 == 0 ? Colors.green : Colors.orangeAccent;
  }
}
