import 'package:kopa/src/core/ui/show_massage_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController with ShowMassageMixin {
  bool _contentProgress = false;

  bool get contentProgress => _contentProgress;

  bool _globalProgress = false;

  bool get globalProgress => _globalProgress;

  final RxBool _isError = RxBool(false);

  RxBool get isError => _isError;

  @protected
  void resetError() {
    if (_isError.isTrue) {
      _isError(false);
    }
  }

  @protected
  void showContentProgress() {
    _contentProgress = true;
    update();
  }

  @protected
  void hideContentProgress() {
    _contentProgress = false;
    update();
  }

  @protected
  void showProgress() {
    _globalProgress = true;
    update();
  }

  @protected
  void hideProgress() {
    _globalProgress = false;
    update();
  }
}
