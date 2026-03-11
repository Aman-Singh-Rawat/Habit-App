import 'package:flutter/cupertino.dart';
import 'package:habitly/app/modules/widgets/buttons/custom_elevated_button.dart';

class ExpandedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const ExpandedButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(buttonText: text, onClick: onPressed),
        ),
      ],
    );
  }
}
