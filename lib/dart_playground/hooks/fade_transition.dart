import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeTransitionHookDemo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final hookController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 0);
    return SafeArea(
      child: Column(
        children: [
          Text('Fade Transition'),
          Container(
            child: GestureDetector(
              onTap: () {
                hookController.forward();
              },
              onDoubleTap: () {
                hookController.reverse();
              },
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: FadeTransition(
                    opacity: hookController,
                    child: ScaleTransition(
                      scale: hookController,
                      child: FlutterLogo(
                        textColor: Colors.blue,
                        size: 200,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
