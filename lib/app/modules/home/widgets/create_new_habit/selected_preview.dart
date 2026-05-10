
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/app_values.dart';

class SelectedPreview extends StatelessWidget {
  const SelectedPreview({required this.emoji});

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(emoji),
      width: width_65,
      height:width_65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius_12),
        color: Colors.deepPurple.withOpacity(0.1),
        border: Border.all(
          color: Colors.deepPurple.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(emoji, style: TextStyle(fontSize: font_34)),
      ),
    );
  }
}
