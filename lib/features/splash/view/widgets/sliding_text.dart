import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(StringManager.welcome, style: Styles.styleRegular12),
          );
        });
  }
}
