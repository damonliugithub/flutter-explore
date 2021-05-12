import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RotationTransitionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('useAnimationController demo'),
        RotationTransitionHookDemo(),
        Divider(),
        Text('Stateful Animation demo'),
        RotationTransitionStatefulDemo()
      ],
    );
  }
}

class RotationTransitionHookDemo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller =
        useAnimationController(duration: Duration(milliseconds: 800));
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: controller,
            child: ColoredBox(
              color: Colors.red,
              child: SizedBox(
                width: 200,
                height: 200,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.isCompleted) {
                controller.reset();
              }
              controller.animateTo(controller.value + 1);
            },
            child: Text(
              'Rotate',
            ),
          ),
        ],
      ),
    );
  }
}

class RotationTransitionStatefulDemo extends StatefulWidget {
  RotationTransitionStatefulDemo({Key? key}) : super(key: key);

  @override
  _RotationTransitionStatefulDemoState createState() =>
      new _RotationTransitionStatefulDemoState();
}

class _RotationTransitionStatefulDemoState
    extends State<RotationTransitionStatefulDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  _RotationTransitionStatefulDemoState();

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: controller,
            child: ColoredBox(
              color: Colors.red,
              child: SizedBox(
                width: 200,
                height: 200,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.isCompleted) {
                controller.reset();
              }
              controller.animateTo(controller.value + 1);
            },
            child: Text(
              'Rotate',
            ),
          ),
        ],
      ),
    );
  }
}
