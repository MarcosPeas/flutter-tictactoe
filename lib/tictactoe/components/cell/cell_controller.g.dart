// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CellController on _CellController, Store {
  final _$selectedAtom = Atom(name: '_CellController.selected');

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$cellTypeAtom = Atom(name: '_CellController.cellType');

  @override
  CellType get cellType {
    _$cellTypeAtom.reportRead();
    return super.cellType;
  }

  @override
  set cellType(CellType value) {
    _$cellTypeAtom.reportWrite(value, super.cellType, () {
      super.cellType = value;
    });
  }

  @override
  String toString() {
    return '''
selected: ${selected},
cellType: ${cellType}
    ''';
  }
}
