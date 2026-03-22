 import 'package:flutter/material.dart';

Widget colorPickerIndicator({Widget? widget}) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: SweepGradient(
          colors: [
            Colors.redAccent,
            Colors.red,
            Colors.orangeAccent,
            Colors.orange,
            Colors.yellowAccent,
            Colors.yellow,
            Colors.greenAccent,
            Colors.green,
            Colors.cyanAccent,
            Colors.cyan,
            Colors.blueAccent,
            Colors.blue,
            Colors.purpleAccent,
            Colors.purple,
            Colors.red,
          ],
        ),
      ),
      child: widget,
      //child: const Center(child: Icon(Icons.color_lens, color: Colors.white)),
    );
  }