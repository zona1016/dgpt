import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseFullLifeCycleController<S> extends BaseController<S>
    with
    // ignore: prefer_mixin
        WidgetsBindingObserver {}

mixin BaseFullLifeCycleMixin<S> on BaseFullLifeCycleController<S> {
  @mustCallSuper
  @override
  void onInit() {
    super.onInit();
    ambiguate(WidgetsBinding.instance)?.addObserver(this);
  }

  @mustCallSuper
  @override
  void onClose() {
    ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    super.onClose();
  }

  @mustCallSuper
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
      case AppLifecycleState.hidden:
        onHidden();
        break;
    }
  }

  void onResumed();
  void onPaused();
  void onInactive();
  void onDetached();
  void onHidden();
}
