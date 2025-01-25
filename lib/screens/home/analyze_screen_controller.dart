import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyzeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => AnalyzeScreenController(), permanent: false, fenix: false);
  }
}

class AnalyzeScreenController extends BaseController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  final List<Animation<double>> rippleScales = [];
  final List<double> rippleOpacities = [];

  @override
  void onInit() {
    super.onInit();

    // Initialize the animation controller
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration of the ripple animation
    )..addListener(() {
      updateRippleAnimations(); // Update ripple animation states
    });

    // Start ripple effect after controller initialization
    startRippleEffect();
  }

  void startRippleEffect() {
    Future.doWhile(() async {
      // Create new ripple at intervals
      createNewRipple();
      await Future.delayed(const Duration(milliseconds: 600));
      return true; // Keep adding ripples
    });
  }

  void createNewRipple() {
    final Animation<double> scaleAnimation = Tween<double>(begin: 0.5, end: 3.0).animate(animationController);
    rippleScales.add(scaleAnimation);
    rippleOpacities.add(1.0);

    // Start the ripple animation
    animationController.forward(from: 0.0);
  }

  void updateRippleAnimations() {
    // Update opacity and scale based on the animation progress
    for (int i = 0; i < rippleScales.length; i++) {
      rippleOpacities[i] = 1.0 - animationController.value; // Fade out effect
    }

    // Remove completed ripples
    if (rippleScales.isNotEmpty && rippleOpacities.first <= 0.0) {
      rippleScales.removeAt(0);
      rippleOpacities.removeAt(0);
    }

    update(); // Trigger UI rebuild
  }

  @override
  void onClose() {
    // Dispose of the animation controller properly
    if (animationController != null) {
      animationController.dispose();
    }
    super.onClose();
  }
}

