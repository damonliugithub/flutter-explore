import 'package:flutter/material.dart';
import 'package:flutter_explore/dart_playground/hooks/fade_transition.dart';
import 'package:flutter_explore/dart_playground/hooks/fade_transition_scroll.dart';
import 'package:flutter_explore/dart_playground/hooks/rotation_transition.dart';

class AnimationIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeTransitionHookDemo(),
            RotationTransitionDemo(),
            FadeTransitionScrollDemo(),
          ],
        ),
      ),
    );
  }
}
