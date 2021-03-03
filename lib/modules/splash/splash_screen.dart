import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _next();
  }

  void _next() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Modular.to.pushReplacementNamed('/tic_tac_toe');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xffe3f2fd),
          child: Center(
            child: Text(
              'Jogo da Velha',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
