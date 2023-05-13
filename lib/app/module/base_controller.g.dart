// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseController on _BaseControllerBase, Store {
  Computed<bool>? _$validODComputed;

  @override
  bool get validOD => (_$validODComputed ??= Computed<bool>(() => super.validOD,
          name: '_BaseControllerBase.validOD'))
      .value;

  late final _$listProductAtom =
      Atom(name: '_BaseControllerBase.listProduct', context: context);

  @override
  List<dynamic> get listProduct {
    _$listProductAtom.reportRead();
    return super.listProduct;
  }

  @override
  set listProduct(List<dynamic> value) {
    _$listProductAtom.reportWrite(value, super.listProduct, () {
      super.listProduct = value;
    });
  }

  late final _$optionAtom =
      Atom(name: '_BaseControllerBase.option', context: context);

  @override
  String? get option {
    _$optionAtom.reportRead();
    return super.option;
  }

  @override
  set option(String? value) {
    _$optionAtom.reportWrite(value, super.option, () {
      super.option = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_BaseControllerBase.date', context: context);

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$_BaseControllerBaseActionController =
      ActionController(name: '_BaseControllerBase', context: context);

  @override
  void setOption(String? value) {
    final _$actionInfo = _$_BaseControllerBaseActionController.startAction(
        name: '_BaseControllerBase.setOption');
    try {
      return super.setOption(value);
    } finally {
      _$_BaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(String value) {
    final _$actionInfo = _$_BaseControllerBaseActionController.startAction(
        name: '_BaseControllerBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_BaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listProduct: ${listProduct},
option: ${option},
date: ${date},
validOD: ${validOD}
    ''';
  }
}
