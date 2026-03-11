import 'package:flutter/cupertino.dart';

class ChooseIconList extends StatelessWidget {
  final int listLength;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  const ChooseIconList({
    super.key,
    required this.itemBuilder,
    required this.listLength,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listLength,
      cacheExtent: 800,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
