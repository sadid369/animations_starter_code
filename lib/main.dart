import 'package:animation_starter_code/explicit_examples/list_animation.dart';
import 'package:animation_starter_code/explicit_examples/loading_animation.dart';
import 'package:animation_starter_code/explicit_examples/login_animation.dart';
import 'package:animation_starter_code/implicit_examples/animated_color_pallete.dart';
import 'package:animation_starter_code/implicit_examples/animated_shopping_cart_button.dart';
import 'package:animation_starter_code/implicit_examples/animated_tween_animation_builder_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Tutorial Rivaan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RadialProgressAnimation(progress: 0.65, color: Colors.blue),
    );
  }
}
