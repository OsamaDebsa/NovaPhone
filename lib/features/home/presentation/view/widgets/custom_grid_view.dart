import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    this.itemCount,
    this.crossAxisCount,
    required this.gridItem,
    this.childAspectRatio,
    this.scrollable = false,
  });

  final int? itemCount;
  final double? childAspectRatio;
  final int? crossAxisCount;
  final Widget Function(BuildContext, int) gridItem;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: scrollable
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount ?? 2,
        childAspectRatio: childAspectRatio ?? 0.7,
      ),
      itemCount: itemCount ?? 4,
      itemBuilder: (context, index) => gridItem(context, index),
    );
  }
}
