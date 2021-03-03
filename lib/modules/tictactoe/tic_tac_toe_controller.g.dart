// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TicTacToeController on _TicTacToeController, Store {
  final _$currentStateAtom = Atom(name: '_TicTacToeController.currentState');

  @override
  TicTacToeState get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(TicTacToeState value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  @override
  String toString() {
    return '''
currentState: ${currentState}
    ''';
  }
}
