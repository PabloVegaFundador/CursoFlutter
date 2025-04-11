import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    //he tenido que subir el mínimo ya que la animación puede hacer que baje del valor indicado
    width = random.nextInt(500).toDouble() + 120;
    height = random.nextInt(1000).toDouble() + 120;
    borderRadius = random.nextInt(100).toDouble() + 20;

    color = Color.fromRGBO(
      random.nextInt(256), // Valores entre 0 y 255
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),

      body: Center(
        child: AnimatedContainer(
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              borderRadius < 0 ? 0 : borderRadius,
            ),
          ),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
