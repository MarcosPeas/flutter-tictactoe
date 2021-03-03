import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tic_tac_toe/app/app_module.dart';
import 'package:tic_tac_toe/modules/tictactoe/tic_tac_toe_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(ModularApp(
      module: AppModule(),
    ));
  });
}

Widget _materialApp() {
  return MaterialApp(
    title: 'Jogo da Velha',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: TicTacToePage(),
  );
}
