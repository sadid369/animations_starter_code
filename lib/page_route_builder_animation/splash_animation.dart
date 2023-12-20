import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation = Tween<double>(begin: 1, end: 10).animate(controller);
    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context).push(
            // PageRouteBuilder(
            //   transitionDuration: Duration(milliseconds: 500),
            //   pageBuilder: (context, animation, secondaryAnimation) {
            //     return const Destination();
            //   },
            //   transitionsBuilder:
            //       (context, animation, secondaryAnimation, child) {
            //     final Animation<Offset> offSetAnimation =
            //         Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
            //             .animate(animation);
            //     return SlideTransition(
            //       position: offSetAnimation,
            //       child: child,
            //     );
            //   },
            // ),
            CustomPageRouteBuilder(route: const Destination()));
        Timer(const Duration(milliseconds: 500), () {
          controller.reset();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: InkWell(
            onTap: () {
              controller.forward();
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
    );
  }
}

class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget route;
  CustomPageRouteBuilder({required this.route})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return route;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final Animation<Offset> offSetAnimation =
                Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                    .animate(animation);
            return SlideTransition(
              position: offSetAnimation,
              child: child,
            );
          },
        );
}
