import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_explore/dart_playground/hooks/custom/use_scroll_hook.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FadeTransitionScrollDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('useAnimationController demo'),
        FadeTransitionUseScrollControllerHookDemo(),
        Divider(),
        Text('Normal Stateful Animation with Scroll Controller demo'),
        FadeTransitionScrollNormalStatefulDemo()
      ],
    );
  }
}

class FadeTransitionUseScrollControllerHookDemo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final animation = useAnimationController(duration: Duration(milliseconds: 800), initialValue: 0);
    final controller = useScrollControllerWithAnimation(animation);
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: SizedBox(
          height: 300,
          child: ListView(
            controller: controller,
            children: List.generate(20, (index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 10),
                ),
                child: GestureDetector(
                  onTap: animation.forward,
                  onDoubleTap: animation.reverse,
                  child: FadeTransition(
                    opacity: animation,
                    child: Center(
                      child: FlutterLogo(
                        size: 200,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class FadeTransitionScrollNormalStatefulDemo extends StatefulWidget {
  FadeTransitionScrollNormalStatefulDemo({Key key}) : super(key: key);

  @override
  _FadeTransitionScrollNormalStatefulDemoState createState() =>
      new _FadeTransitionScrollNormalStatefulDemoState();
}

class _FadeTransitionScrollNormalStatefulDemoState
    extends State<FadeTransitionScrollNormalStatefulDemo>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  ScrollController scrollController;

  _FadeTransitionScrollNormalStatefulDemoState();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 800), value: 1);
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          animationController.forward();
        } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          animationController.reverse();
        } else {
          print('Not Scrolling');
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: SizedBox(
          height: 300,
          child: ListView(
            controller: scrollController,
            children: List.generate(20, (index) {
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 10),
                ),
                child: GestureDetector(
                  onTap: animationController.forward,
                  onDoubleTap: animationController.reverse,
                  child: FadeTransition(
                    opacity: animationController,
                    child: Center(
                      child: FlutterLogo(
                        size: 200,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
