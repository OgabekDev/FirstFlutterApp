import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  const RandomizerPage({super.key, required this.min, required this.max});

  final int min, max;

  @override
  Widget build(BuildContext context) {

    final generatedNumber = useState<int>(0);
    final randomGenerator = Random();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Randomizer"),
      ),
      body: Center(
        child: Text(
          generatedNumber.value.toString(),
          style: const TextStyle(
              fontSize: 42
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Generate"),
        onPressed: () {
          generatedNumber.value = min + randomGenerator.nextInt(max + 1 - min);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}