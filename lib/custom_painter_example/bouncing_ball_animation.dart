// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bounceAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    bounceAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                  animation: bounceAnimation,
                  builder: (context, child) {
                    return CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width,
                        400,
                      ),
                      painter: BouncingCustomPainter(
                        animationValue: bounceAnimation.value,
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class BouncingCustomPainter extends CustomPainter {
  final double animationValue;
  BouncingCustomPainter({
    required this.animationValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    return canvas.drawCircle(
      Offset(size.width / 2, size.height - (size.height * animationValue)),
      20,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
