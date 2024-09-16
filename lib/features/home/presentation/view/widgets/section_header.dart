import 'package:flutter/material.dart';
import 'package:nova_phone/core/utils/string_manage.dart';
import 'package:nova_phone/core/utils/styles.dart';

class RecommendedSectionHeader extends StatelessWidget {
  const RecommendedSectionHeader(
      {super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.styleBold24),
          const Text(
            StringManager.seeMore,
            style: Styles.styleRegular16,
          ),
        ],
      ),
    );
  }
}
