import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class _ScrollerHook extends Hook<ScrollController> {
  final AnimationController animationController;

  _ScrollerHook(this.animationController);

  @override
  HookState<ScrollController, Hook<ScrollController>> createState() {
    return _ScrollerHookState();
  }
}

class _ScrollerHookState extends HookState<ScrollController, _ScrollerHook> {
  ScrollController scrollController = ScrollController();

  void scrollAnimation(AnimationController animationController,
      ScrollController scrollController) {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      animationController.forward();
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      animationController.reverse();
    } else {
      print('Not Scrolling');
    }
  }

  @override
  void initHook() {
    super.initHook();
    scrollController.addListener(() {
      scrollAnimation(hook.animationController, scrollController);
    });
  }

  @override
  ScrollController build(BuildContext context) {
    return scrollController;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}

ScrollController useScrollControllerWithAnimation(
    AnimationController animationController) {
  return use(_ScrollerHook(animationController));
}
